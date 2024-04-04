Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C203898D35
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 19:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40967113335;
	Thu,  4 Apr 2024 17:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bs+Ol5fa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FB811319A;
 Thu,  4 Apr 2024 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712251930; x=1743787930;
 h=date:from:to:cc:subject:message-id;
 bh=iDENfRL6ui3ILbidX3/Scs7sZFLGs7j+kBl2HsO25eU=;
 b=bs+Ol5faP3t1G/md7vOxOd4BDRSFtvDqjq/Q4Ma9QdCHJODbWn50AEvh
 yL4Bf/UcfV3V0nMp6T8I3pw4H3QRohPWbvlVxLvAu8dXmXRNAY8mPjUUb
 eGnBiok1f3i09512sTwgQkBmb/lndkKlAzirwceqZIenJiH6FVrDOhWoC
 rsRJnnj0a8bAGp6JeqMjclgxQOzM7Pn7Xi29ztuU4GzwZ8Rfijhf2t959
 dLmMLSVHmh9XxoTNQY7MHFEkZZgUPiswi5StBeZ6QH+gm5PfLB+pUtpdX
 EDzSfO5wAkjaeujSM6VnPypGUNWyAosBhEatjaO8ISmlB2zHQibqq+yXh A==;
X-CSE-ConnectionGUID: 0ZmaIzrUREyxDUGIaMbHwQ==
X-CSE-MsgGUID: 3la734UbSGWEP39gY3mT9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8132418"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8132418"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 10:32:06 -0700
X-CSE-ConnectionGUID: pPdD5725RT62FV++RGjNUw==
X-CSE-MsgGUID: YMKkberESOC3WVMhwREtZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="50098182"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2024 10:32:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rsQwS-0001K2-0F;
 Thu, 04 Apr 2024 17:32:00 +0000
Date: Fri, 05 Apr 2024 01:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arch@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [linux-next:master] BUILD REGRESSION
 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd
Message-ID: <202404050141.vlY0lICt-lkp@intel.com>
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
branch HEAD: 2b3d5988ae2cb5cd945ddbc653f0a71706231fdd  Add linux-next specific files for 20240404

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202404041707.4Bl4ifTI-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404041832.tMSAtKyB-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202404042327.jRpt81kP-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "__aeabi_d2ulz" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "__aeabi_l2d" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
drivers/input/serio/parkbd.c:168:10: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/parkbd.c:168:10: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/parkbd.c:168:10: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
drivers/input/serio/ps2-gpio.c:408:10: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/ps2-gpio.c:408:10: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/ps2-gpio.c:408:10: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
drivers/input/serio/ps2mult.c:130:10: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/ps2mult.c:130:10: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/ps2mult.c:130:10: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
drivers/input/serio/serio_raw.c:95:11: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/serio_raw.c:95:11: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
drivers/input/serio/serio_raw.c:95:11: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
include/linux/mempool.h:105:9: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
include/linux/mempool.h:105:9: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
include/linux/mempool.h:105:9: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
include/linux/mempool.h:105:9: error: non-extern declaration of '_alloc_tag_cntr' follows extern declaration
include/linux/mempool.h:105:9: error: weak declaration cannot have internal linkage
ld.lld: error: undefined symbol: i2c_root_adapter
powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data249' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data249'

Unverified Error/Warning (likely false positive, please contact us if interested):

include/linux/mm_types.h:1175:17: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
include/linux/mm_types.h:1175:17: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
include/linux/mm_types.h:1175:17: error: non-extern declaration of '__pcpu_unique__alloc_tag_cntr' follows extern declaration
include/linux/mm_types.h:1175:17: error: non-extern declaration of '_alloc_tag_cntr' follows extern declaration
include/linux/mm_types.h:1175:17: error: weak declaration cannot have internal linkage
{standard input}:722: Warning: overflow in branch to .L153; converted into longer instruction sequence
{standard input}:733: Warning: overflow in branch to .L155; converted into longer instruction sequence

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- alpha-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- alpha-randconfig-r061-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- alpha-randconfig-r111-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arc-allmodconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arc-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arc-allyesconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arc-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arc-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arc-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-alldefconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-allmodconfig
|   |-- ERROR:__aeabi_d2ulz-drivers-gpu-drm-amd-amdgpu-amdgpu.ko-undefined
|   |-- ERROR:__aeabi_l2d-drivers-gpu-drm-amd-amdgpu-amdgpu.ko-undefined
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-mvebu_v5_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-randconfig-r132-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-s3c6400_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-wpcm450_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-randconfig-004-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-randconfig-r113-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- csky-randconfig-r133-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-allyesconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-buildonly-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-buildonly-randconfig-004-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-buildonly-randconfig-006-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-004-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-011-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-013-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-015-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-016-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-051-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-053-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-141-20240404
|   |-- drivers-pwm-core.c-pwm_cdev_ioctl()-warn:possible-spectre-second-half.-pwm
|   |-- drivers-pwm-core.c-pwm_cdev_ioctl()-warn:potential-spectre-issue-cdata-pwm-r
|   |-- drivers-usb-dwc2-hcd_ddma.c-dwc2_cmpl_host_isoc_dma_desc()-warn:variable-dereferenced-before-check-qtd-urb-(see-line-)
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- loongarch-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- loongarch-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- loongarch-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- loongarch-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- loongarch-randconfig-r051-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- m68k-allmodconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- m68k-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- m68k-allyesconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- m68k-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- m68k-m5407c3_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- microblaze-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- microblaze-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- microblaze-randconfig-r064-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- mips-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- mips-allyesconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- mips-cu1000-neo_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- nios2-allmodconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- nios2-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- nios2-allyesconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- nios2-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- nios2-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- nios2-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- nios2-randconfig-r053-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- openrisc-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- openrisc-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-nouveau-nvif-object.c:error:memcpy-accessing-or-more-bytes-at-offsets-and-overlaps-bytes-at-offset
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-nouveau-nvif-object.c:error:memcpy-accessing-or-more-bytes-at-offsets-and-overlaps-bytes-at-offset
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc-randconfig-r122-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- parisc64-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-cell_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-powernv_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc64-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc64-randconfig-r016-20220119
|   `-- powerpc64-linux-ld:warning:orphan-section-bss..Lubsan_data249-from-kernel-ptrace.o-being-placed-in-section-.bss..Lubsan_data249
|-- powerpc64-randconfig-r131-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- s390-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- s390-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-allmodconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-allyesconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-randconfig-r001-20211027
|   |-- standard-input:Warning:overflow-in-branch-to-.L153-converted-into-longer-instruction-sequence
|   `-- standard-input:Warning:overflow-in-branch-to-.L155-converted-into-longer-instruction-sequence
|-- sh-sdk7786_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-se7619_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sh-sh2007_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc-randconfig-001-20240404
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc-randconfig-002-20240404
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc-randconfig-r052-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc-randconfig-r062-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc64-allmodconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc64-allyesconfig
|   |-- drivers-gpu-drm-imx-ipuv3-imx-ldb.c:error:_sel-directive-output-may-be-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- drivers-gpu-drm-nouveau-nouveau_backlight.c:error:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc64-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc64-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- sparc64-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- um-allyesconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- um-i386_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-buildonly-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-buildonly-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-buildonly-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-004-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-005-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-006-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-015-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-016-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-071-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-074-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-076-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-101-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-102-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-103-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-121-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-122-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-123-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- xtensa-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- xtensa-common_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- xtensa-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- xtensa-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
`-- xtensa-randconfig-r121-20240404
    |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
    `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
clang_recent_errors
|-- arm-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-pxa3xx_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm-randconfig-004-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-different-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-lima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-type-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-renesas-rcar-du-rcar_cmm.c:error:unused-function-rcar_cmm_read-Werror-Wunused-function
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-randconfig-r063-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- arm64-randconfig-r112-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- hexagon-allmodconfig
|   |-- include-asm-generic-io.h:error:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior-Werror-Wnull-pointer-arithmetic
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- hexagon-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- hexagon-allyesconfig
|   |-- include-asm-generic-io.h:error:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior-Werror-Wnull-pointer-arithmetic
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- hexagon-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- hexagon-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- hexagon-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-buildonly-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-buildonly-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-buildonly-randconfig-005-20240404
|   |-- ld.lld:error:undefined-symbol:i2c_root_adapter
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-005-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-006-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-012-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-014-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-052-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-054-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-061-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-062-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- i386-randconfig-063-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- mips-bcm63xx_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- mips-loongson1b_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-different-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-lima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-bios-shadowof.c:error:cast-from-void-(-)(const-void-)-to-void-(-)(void-)-converts-to-incompatible-function-type-Werror-Wcast-function-type-strict
|   |-- drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-type-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc-skiroot_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc64-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc64-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- powerpc64-randconfig-r123-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-different-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-lima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-type-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dce110-irq_service_dce110.c:error:arithmetic-between-different-enumeration-types-(-enum-dc_irq_source-and-enum-irq_type-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-different-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-lima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-type-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-nommu_virt_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- riscv-randconfig-r054-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- s390-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-amd_asic_type-and-enum-amd_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_ras.c:error:arithmetic-between-different-enumeration-types-(-enum-amdgpu_ras_block-and-enum-amdgpu_ras_mca_block-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_cursor.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_ddi.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-phy-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_display_irq.c:error:arithmetic-between-different-enumeration-types-(-enum-transcoder-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_dpll_mgr.c:error:arithmetic-between-different-enumeration-types-(-enum-tc_port-and-enum-intel_dpll_id-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_hotplug.c:error:arithmetic-between-different-enumeration-types-(-enum-hpd_pin-and-enum-port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_pipe_crc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_tc.c:error:arithmetic-between-different-enumeration-types-(-enum-intel_display_power_domain-and-enum-tc_port-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-intel_vdsc.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-skl_universal_plane.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-i915-display-skl_watermark.c:error:arithmetic-between-different-enumeration-types-(-enum-pipe-and-enum-intel_display_power_domain-)-Werror-Wenum-enum-conversion
|   |-- drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-lima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-type-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-radeon-radeon_drv.c:error:bitwise-operation-between-different-enumeration-types-(-enum-radeon_family-and-enum-radeon_chip_flags-)-Werror-Wenum-enum-conversion
|   |-- include-asm-generic-io.h:error:performing-pointer-arithmetic-on-a-null-pointer-has-undefined-behavior-Werror-Wnull-pointer-arithmetic
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- s390-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- s390-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- s390-randconfig-002-20240328
|   |-- drivers-input-serio-parkbd.c:error:__section__-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- drivers-input-serio-parkbd.c:error:non-extern-declaration-of-__pcpu_unique__alloc_tag_cntr-follows-extern-declaration
|   |-- drivers-input-serio-parkbd.c:error:section-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- drivers-input-serio-ps2-gpio.c:error:__section__-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- drivers-input-serio-ps2-gpio.c:error:non-extern-declaration-of-__pcpu_unique__alloc_tag_cntr-follows-extern-declaration
|   |-- drivers-input-serio-ps2-gpio.c:error:section-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- drivers-input-serio-ps2mult.c:error:__section__-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- drivers-input-serio-ps2mult.c:error:non-extern-declaration-of-__pcpu_unique__alloc_tag_cntr-follows-extern-declaration
|   |-- drivers-input-serio-ps2mult.c:error:section-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- drivers-input-serio-serio_raw.c:error:__section__-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- drivers-input-serio-serio_raw.c:error:non-extern-declaration-of-__pcpu_unique__alloc_tag_cntr-follows-extern-declaration
|   |-- drivers-input-serio-serio_raw.c:error:section-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- include-linux-mempool.h:error:__section__-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- include-linux-mempool.h:error:non-extern-declaration-of-__pcpu_unique__alloc_tag_cntr-follows-extern-declaration
|   |-- include-linux-mempool.h:error:non-extern-declaration-of-_alloc_tag_cntr-follows-extern-declaration
|   |-- include-linux-mempool.h:error:section-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- include-linux-mempool.h:error:weak-declaration-cannot-have-internal-linkage
|   |-- include-linux-mm_types.h:error:__section__-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   |-- include-linux-mm_types.h:error:non-extern-declaration-of-__pcpu_unique__alloc_tag_cntr-follows-extern-declaration
|   |-- include-linux-mm_types.h:error:non-extern-declaration-of-_alloc_tag_cntr-follows-extern-declaration
|   |-- include-linux-mm_types.h:error:section-attribute-only-applies-to-functions-global-variables-Objective-C-methods-and-Objective-C-properties
|   `-- include-linux-mm_types.h:error:weak-declaration-cannot-have-internal-linkage
|-- um-allmodconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- um-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- um-defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- um-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- um-randconfig-002-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- um-x86_64_defconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-allmodconfig
|   |-- drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc_freq_target_hi_bits-Werror-Wunused-function
|   |-- drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc_freq_target_low_bits-Werror-Wunused-function
|   |-- drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-lima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-type-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-allnoconfig
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc_freq_target_hi_bits-Werror-Wunused-function
|   |-- drivers-gpu-drm-kmb-kmb_dsi.c:error:unused-function-set_test_mode_src_osc_freq_target_low_bits-Werror-Wunused-function
|   |-- drivers-gpu-drm-lima-lima_drv.c:error:cast-to-smaller-integer-type-enum-lima_gpu_id-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- drivers-gpu-drm-msm-adreno-a6xx_gpu_state.c:error:variable-out-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- drivers-gpu-drm-pl111-pl111_versatile.c:error:cast-to-smaller-integer-type-enum-versatile_clcd-from-const-void-Werror-Wvoid-pointer-to-enum-cast
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-buildonly-randconfig-004-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-buildonly-randconfig-005-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-buildonly-randconfig-006-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-001-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-003-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-011-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-012-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-013-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-014-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-072-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-073-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-075-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-104-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
|-- x86_64-randconfig-161-20240404
|   |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
|   `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node
`-- x86_64-rhel-8.3-rust
    |-- mm-mempool.c:warning:Function-parameter-or-struct-member-gfp_mask-not-described-in-mempool_create_node
    `-- mm-mempool.c:warning:Function-parameter-or-struct-member-node_id-not-described-in-mempool_create_node

elapsed time: 849m

configs tested: 179
configs skipped: 4

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240404   gcc  
arc                   randconfig-002-20240404   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                        mvebu_v5_defconfig   gcc  
arm                          pxa3xx_defconfig   clang
arm                   randconfig-001-20240404   gcc  
arm                   randconfig-002-20240404   gcc  
arm                   randconfig-003-20240404   clang
arm                   randconfig-004-20240404   clang
arm                         s3c6400_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240404   gcc  
arm64                 randconfig-002-20240404   gcc  
arm64                 randconfig-003-20240404   clang
arm64                 randconfig-004-20240404   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240404   gcc  
csky                  randconfig-002-20240404   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240404   clang
hexagon               randconfig-002-20240404   clang
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240404   gcc  
i386         buildonly-randconfig-002-20240404   clang
i386         buildonly-randconfig-003-20240404   clang
i386         buildonly-randconfig-004-20240404   gcc  
i386         buildonly-randconfig-005-20240404   clang
i386         buildonly-randconfig-006-20240404   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240404   gcc  
i386                  randconfig-002-20240404   clang
i386                  randconfig-003-20240404   clang
i386                  randconfig-004-20240404   gcc  
i386                  randconfig-005-20240404   clang
i386                  randconfig-006-20240404   clang
i386                  randconfig-011-20240404   gcc  
i386                  randconfig-012-20240404   clang
i386                  randconfig-013-20240404   gcc  
i386                  randconfig-014-20240404   clang
i386                  randconfig-015-20240404   gcc  
i386                  randconfig-016-20240404   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240404   gcc  
loongarch             randconfig-002-20240404   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                     cu1000-neo_defconfig   gcc  
mips                     loongson1b_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240404   gcc  
nios2                 randconfig-002-20240404   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240404   gcc  
parisc                randconfig-002-20240404   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc                     powernv_defconfig   gcc  
powerpc               randconfig-001-20240404   gcc  
powerpc               randconfig-002-20240404   gcc  
powerpc               randconfig-003-20240404   clang
powerpc                     skiroot_defconfig   clang
powerpc64             randconfig-001-20240404   gcc  
powerpc64             randconfig-002-20240404   clang
powerpc64             randconfig-003-20240404   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20240404   clang
riscv                 randconfig-002-20240404   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240404   gcc  
s390                  randconfig-002-20240404   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240404   gcc  
sh                    randconfig-002-20240404   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240404   gcc  
sparc64               randconfig-002-20240404   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240404   clang
um                    randconfig-002-20240404   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240404   gcc  
x86_64       buildonly-randconfig-002-20240404   gcc  
x86_64       buildonly-randconfig-003-20240404   gcc  
x86_64       buildonly-randconfig-004-20240404   clang
x86_64       buildonly-randconfig-005-20240404   clang
x86_64       buildonly-randconfig-006-20240404   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240404   clang
x86_64                randconfig-002-20240404   gcc  
x86_64                randconfig-003-20240404   clang
x86_64                randconfig-004-20240404   gcc  
x86_64                randconfig-005-20240404   gcc  
x86_64                randconfig-006-20240404   gcc  
x86_64                randconfig-011-20240404   clang
x86_64                randconfig-012-20240404   clang
x86_64                randconfig-013-20240404   clang
x86_64                randconfig-014-20240404   clang
x86_64                randconfig-015-20240404   gcc  
x86_64                randconfig-016-20240404   gcc  
x86_64                randconfig-071-20240404   gcc  
x86_64                randconfig-072-20240404   clang
x86_64                randconfig-073-20240404   clang
x86_64                randconfig-074-20240404   gcc  
x86_64                randconfig-075-20240404   clang
x86_64                randconfig-076-20240404   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240404   gcc  
xtensa                randconfig-002-20240404   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
