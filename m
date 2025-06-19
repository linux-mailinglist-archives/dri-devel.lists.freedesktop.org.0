Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF5FADFD8B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 08:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E0110E214;
	Thu, 19 Jun 2025 06:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djv9lLzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB80610E214
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 06:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750313788; x=1781849788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=S2nJfHuAEgVWMuoP5MIOULxkZy7iA+qQ3cFHZksQqNo=;
 b=djv9lLzJBnC4T1rUjkpBF9gmG1/BFP3rBx2+CKsbYlZfiI10LVpRUr4r
 jZnh9uJ+MPQe0i800i/R500wltG4vJXk8/XaMt+5bowikr8Thb9hsfgAn
 UrMbd4GIMf8czy47XDFNx7kZcOMVI5yQFqiJLSvMbpT7j3Xp1H2bxUx21
 npscHPyv6SBWdQrY+SSqu0jj7KsNfIn1fJsFNmBcPfuJDP/MdSv4la2rg
 yvzSSBwoTqpT1x4LnZqwwX60w3gAYwzSG0lgwIX8Md5ZF/z6GVxmpdWZ2
 j7jxc07qOeUWbFM+ZJZMBq/qC4HLQ6zz+BMB/9Pb7NlGcxn07kiZuM9Df Q==;
X-CSE-ConnectionGUID: o79zQXFMQO6BsIFWJuj5Mw==
X-CSE-MsgGUID: iUgxisLASmKt+pPxs5wNOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52701396"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="52701396"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 23:16:27 -0700
X-CSE-ConnectionGUID: ldkW5VCUQ7aMYWaWZN8i+w==
X-CSE-MsgGUID: GoYIM3RQTpOnUtUfDen5uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; d="scan'208";a="154769012"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 18 Jun 2025 23:16:20 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uS8ZO-000KSc-1i;
 Thu, 19 Jun 2025 06:16:18 +0000
Date: Thu, 19 Jun 2025 14:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
Message-ID: <202506191323.zD1fszQb-lkp@intel.com>
References: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-8-27ed33ea5c6f@samsung.com>
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

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4774cfe3543abb8ee98089f535e28ebfd45b975a]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/power-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driver/20250618-182429
base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
patch link:    https://lore.kernel.org/r/20250618-apr_14_for_sending-v5-8-27ed33ea5c6f%40samsung.com
patch subject: [PATCH v5 8/8] drm/imagination: Enable PowerVR driver for RISC-V
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250619/202506191323.zD1fszQb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191323.zD1fszQb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191323.zD1fszQb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/imagination/pvr_ccb.c:5:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_read64':
   drivers/gpu/drm/imagination/pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_write64':
   drivers/gpu/drm/imagination/pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from drivers/gpu/drm/imagination/pvr_device.h:23:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/imagination/pvr_context.h:17,
                    from drivers/gpu/drm/imagination/pvr_drv.c:4:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_read64':
   drivers/gpu/drm/imagination/pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_write64':
   drivers/gpu/drm/imagination/pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from drivers/gpu/drm/imagination/pvr_device.h:23:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/drm/spsc_queue.h:27,
                    from include/drm/gpu_scheduler.h:27,
                    from drivers/gpu/drm/imagination/pvr_context.h:7:
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h: At top level:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bits.h:32,
                    from drivers/gpu/drm/imagination/pvr_rogue_fwif_client.h:7,
                    from drivers/gpu/drm/imagination/pvr_stream_defs.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/imagination/pvr_vm.c:6:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_read64':
   drivers/gpu/drm/imagination/pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_write64':
   drivers/gpu/drm/imagination/pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from drivers/gpu/drm/imagination/pvr_device.h:23:
   drivers/gpu/drm/imagination/pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/gpu/drm/imagination/pvr_rogue_fwif.h:10,
                    from drivers/gpu/drm/imagination/pvr_ccb.h:7,
                    from drivers/gpu/drm/imagination/pvr_device.h:7:
   drivers/gpu/drm/imagination/pvr_vm.c: In function 'pvr_vm_create_context':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1099511627776' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   arch/x86/include/asm/bitops.h:265:40: note: in definition of macro '__ffs'
     265 |          (unsigned long)__builtin_ctzl(word) :  \
         |                                        ^~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:63:41: note: in expansion of macro '_AC'
      63 | #define SZ_1T                           _AC(0x10000000000, ULL)
         |                                         ^~~
   drivers/gpu/drm/imagination/pvr_mmu.h:87:40: note: in expansion of macro 'SZ_1T'
      87 | #define PVR_PAGE_TABLE_ADDR_SPACE_SIZE SZ_1T
         |                                        ^~~~~
   drivers/gpu/drm/imagination/pvr_mmu.h:88:40: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_SPACE_SIZE'
      88 | #define PVR_PAGE_TABLE_ADDR_BITS __ffs(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_vm.c:556:33: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_BITS'
     556 |         if (device_addr_bits != PVR_PAGE_TABLE_ADDR_BITS) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from pvr_ccb.c:5:
   pvr_device.h: In function 'pvr_cr_read64':
   pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   pvr_device.h: In function 'pvr_cr_write64':
   pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from pvr_device.h:23:
   pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from pvr_context.h:17,
                    from pvr_drv.c:4:
   pvr_device.h: In function 'pvr_cr_read64':
   pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   pvr_device.h: In function 'pvr_cr_write64':
   pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from pvr_device.h:23:
   pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:103,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/drm/spsc_queue.h:27,
                    from include/drm/gpu_scheduler.h:27,
                    from pvr_context.h:7:
   pvr_rogue_fwif_client_check.h: At top level:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/bits.h:32,
                    from pvr_rogue_fwif_client.h:7,
                    from pvr_stream_defs.c:5:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct rogue_fwif_cmd_compute, regs) incorrect"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:10:9: note: in expansion of macro 'static_assert'
      10 |         static_assert(offsetof(type, member) == (offset), \
         |         ^~~~~~~~~~~~~
   pvr_rogue_fwif_client_check.h:97:1: note: in expansion of macro 'OFFSET_CHECK'
      97 | OFFSET_CHECK(struct rogue_fwif_cmd_compute, regs, 8);
         | ^~~~~~~~~~~~
--
   In file included from pvr_vm.c:6:
   pvr_device.h: In function 'pvr_cr_read64':
   pvr_device.h:580:16: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Werror=implicit-function-declaration]
     580 |         return ioread64(pvr_dev->regs + reg);
         |                ^~~~~~~~
         |                ioread32
   pvr_device.h: In function 'pvr_cr_write64':
   pvr_device.h:604:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Werror=implicit-function-declaration]
     604 |         iowrite64(val, pvr_dev->regs + reg);
         |         ^~~~~~~~~
         |         iowrite32
   In file included from pvr_device.h:23:
   pvr_device.h: In function 'pvr_cr_poll_reg64':
>> include/linux/iopoll.h:176:28: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |                            ^~~~~
   include/linux/iopoll.h:46:25: note: in definition of macro 'read_poll_timeout'
      46 |                 (val) = op(args); \
         |                         ^~
   include/linux/iopoll.h:176:9: note: in expansion of macro 'readx_poll_timeout'
     176 |         readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~
   pvr_device.h:649:16: note: in expansion of macro 'readq_poll_timeout'
     649 |         return readq_poll_timeout(pvr_dev->regs + reg_addr, value,
         |                ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from pvr_rogue_fwif.h:10,
                    from pvr_ccb.h:7,
                    from pvr_device.h:7:
   pvr_vm.c: In function 'pvr_vm_create_context':
>> include/uapi/linux/const.h:20:25: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1099511627776' to '0' [-Woverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   arch/x86/include/asm/bitops.h:265:40: note: in definition of macro '__ffs'
     265 |          (unsigned long)__builtin_ctzl(word) :  \
         |                                        ^~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:63:41: note: in expansion of macro '_AC'
      63 | #define SZ_1T                           _AC(0x10000000000, ULL)
         |                                         ^~~
   pvr_mmu.h:87:40: note: in expansion of macro 'SZ_1T'
      87 | #define PVR_PAGE_TABLE_ADDR_SPACE_SIZE SZ_1T
         |                                        ^~~~~
   pvr_mmu.h:88:40: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_SPACE_SIZE'
      88 | #define PVR_PAGE_TABLE_ADDR_BITS __ffs(PVR_PAGE_TABLE_ADDR_SPACE_SIZE)
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   pvr_vm.c:556:33: note: in expansion of macro 'PVR_PAGE_TABLE_ADDR_BITS'
     556 |         if (device_addr_bits != PVR_PAGE_TABLE_ADDR_BITS) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +176 include/linux/iopoll.h

57a29df341466b Kai-Heng Feng      2020-04-25  115  
54c523127bcca9 Matt Wagantall     2014-12-15  116  /**
54c523127bcca9 Matt Wagantall     2014-12-15  117   * readx_poll_timeout - Periodically poll an address until a condition is met or a timeout occurs
54c523127bcca9 Matt Wagantall     2014-12-15  118   * @op: accessor function (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall     2014-12-15  119   * @addr: Address to poll
54c523127bcca9 Matt Wagantall     2014-12-15  120   * @val: Variable to read the value into
54c523127bcca9 Matt Wagantall     2014-12-15  121   * @cond: Break condition (usually involving @val)
89124747f096fc Anna-Maria Behnsen 2024-10-14  122   * @sleep_us: Maximum time to sleep between reads in us (0 tight-loops). Please
89124747f096fc Anna-Maria Behnsen 2024-10-14  123   *            read usleep_range() function description for details and
89124747f096fc Anna-Maria Behnsen 2024-10-14  124   *            limitations.
54c523127bcca9 Matt Wagantall     2014-12-15  125   * @timeout_us: Timeout in us, 0 means never timeout
54c523127bcca9 Matt Wagantall     2014-12-15  126   *
54c523127bcca9 Matt Wagantall     2014-12-15  127   * When available, you'll probably want to use one of the specialized
54c523127bcca9 Matt Wagantall     2014-12-15  128   * macros defined below rather than this macro directly.
89124747f096fc Anna-Maria Behnsen 2024-10-14  129   *
89124747f096fc Anna-Maria Behnsen 2024-10-14  130   * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
89124747f096fc Anna-Maria Behnsen 2024-10-14  131   * case, the last read value at @addr is stored in @val. Must not
89124747f096fc Anna-Maria Behnsen 2024-10-14  132   * be called from atomic context if sleep_us or timeout_us are used.
54c523127bcca9 Matt Wagantall     2014-12-15  133   */
54c523127bcca9 Matt Wagantall     2014-12-15  134  #define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)	\
eaa6b01024a74a Dejin Zheng        2020-03-23  135  	read_poll_timeout(op, val, cond, sleep_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall     2014-12-15  136  
54c523127bcca9 Matt Wagantall     2014-12-15  137  /**
54c523127bcca9 Matt Wagantall     2014-12-15  138   * readx_poll_timeout_atomic - Periodically poll an address until a condition is met or a timeout occurs
54c523127bcca9 Matt Wagantall     2014-12-15  139   * @op: accessor function (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall     2014-12-15  140   * @addr: Address to poll
54c523127bcca9 Matt Wagantall     2014-12-15  141   * @val: Variable to read the value into
54c523127bcca9 Matt Wagantall     2014-12-15  142   * @cond: Break condition (usually involving @val)
89124747f096fc Anna-Maria Behnsen 2024-10-14  143   * @delay_us: Time to udelay between reads in us (0 tight-loops). Please
89124747f096fc Anna-Maria Behnsen 2024-10-14  144   *            read udelay() function description for details and
89124747f096fc Anna-Maria Behnsen 2024-10-14  145   *            limitations.
54c523127bcca9 Matt Wagantall     2014-12-15  146   * @timeout_us: Timeout in us, 0 means never timeout
54c523127bcca9 Matt Wagantall     2014-12-15  147   *
54c523127bcca9 Matt Wagantall     2014-12-15  148   * When available, you'll probably want to use one of the specialized
54c523127bcca9 Matt Wagantall     2014-12-15  149   * macros defined below rather than this macro directly.
89124747f096fc Anna-Maria Behnsen 2024-10-14  150   *
89124747f096fc Anna-Maria Behnsen 2024-10-14  151   * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
89124747f096fc Anna-Maria Behnsen 2024-10-14  152   * case, the last read value at @addr is stored in @val.
54c523127bcca9 Matt Wagantall     2014-12-15  153   */
54c523127bcca9 Matt Wagantall     2014-12-15  154  #define readx_poll_timeout_atomic(op, addr, val, cond, delay_us, timeout_us) \
57a29df341466b Kai-Heng Feng      2020-04-25  155  	read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall     2014-12-15  156  
54c523127bcca9 Matt Wagantall     2014-12-15  157  #define readb_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  158  	readx_poll_timeout(readb, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  159  
54c523127bcca9 Matt Wagantall     2014-12-15  160  #define readb_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  161  	readx_poll_timeout_atomic(readb, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  162  
54c523127bcca9 Matt Wagantall     2014-12-15  163  #define readw_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  164  	readx_poll_timeout(readw, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  165  
54c523127bcca9 Matt Wagantall     2014-12-15  166  #define readw_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  167  	readx_poll_timeout_atomic(readw, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  168  
54c523127bcca9 Matt Wagantall     2014-12-15  169  #define readl_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  170  	readx_poll_timeout(readl, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  171  
54c523127bcca9 Matt Wagantall     2014-12-15  172  #define readl_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  173  	readx_poll_timeout_atomic(readl, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  174  
54c523127bcca9 Matt Wagantall     2014-12-15  175  #define readq_poll_timeout(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15 @176  	readx_poll_timeout(readq, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  177  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
