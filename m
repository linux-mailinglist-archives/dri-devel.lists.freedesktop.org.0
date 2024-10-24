Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471259AF516
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 00:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC82210E3C5;
	Thu, 24 Oct 2024 22:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uij94FuM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6304410E3C6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729807711; x=1761343711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dq8V3lZPoMG7c4QB3Q+AJI+f2SVoA1/4ndLmjpYjO5U=;
 b=Uij94FuMVcm10+TBGiyx+KSLel3ZqFCsbUPG2qHpBAkPBUHZxDb63/uk
 iRC0Wmf7r3TPipKGTfPwel5eUvE1bqCtRBR8wqPa/fOXb2iZtXK6uDoMC
 M6P6QUlQb5nyNMVcf04J06X5huCR17W1O69Of84VGFnTuedtUzPAsspJW
 /lUutrWMSDKVGxukwFXQaeZwZLVzWhQEtj5OD6gRaPneqW7IdqIekUba2
 v+nNPIJhE0Nxcg+ZVBVt8bOT5Gn5RrhqsXc5YzlByrZS1OySeTyyCo6Nu
 jfIyVw1lziDhYLqBLfdECJO5qN+DxhPyCV4rQUhSOwKU/SauTV2Mknlqd g==;
X-CSE-ConnectionGUID: Rn/t5TK8QcyWTRTkZkgzkA==
X-CSE-MsgGUID: M4aqyIhcTzqmAMRkBKmeWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="33269206"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="33269206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 15:08:31 -0700
X-CSE-ConnectionGUID: k11lQ5etShi/Wk82RPJmyw==
X-CSE-MsgGUID: VBHRFo5uTyqR6GmWKiS2jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85272830"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 15:08:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t460E-000XCC-12;
 Thu, 24 Oct 2024 22:08:22 +0000
Date: Fri, 25 Oct 2024 06:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 11/37] drm/vc4: hvs: Add support for BCM2712 HVS
Message-ID: <202410250541.6AcfkD5k-lkp@intel.com>
References: <20241023-drm-vc4-2712-support-v1-11-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-11-1cc2d5594907@raspberrypi.com>
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on 91e21479c81dd4e9e22a78d7446f92f6b96a7284]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/drm-vc4-Limit-max_bpc-to-8-on-Pi0-3/20241024-005239
base:   91e21479c81dd4e9e22a78d7446f92f6b96a7284
patch link:    https://lore.kernel.org/r/20241023-drm-vc4-2712-support-v1-11-1cc2d5594907%40raspberrypi.com
patch subject: [PATCH 11/37] drm/vc4: hvs: Add support for BCM2712 HVS
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410250541.6AcfkD5k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 5886454669c3c9026f7f27eab13509dd0241f2d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250541.6AcfkD5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250541.6AcfkD5k-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vc4/vc4_kms.c:17:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_kms.c:17:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_kms.c:17:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/vc4/vc4_kms.c:17:
   In file included from include/drm/drm_atomic.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/vc4/vc4_kms.c:357:3: warning: variable 'mux' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     357 |                 default:
         |                 ^~~~~~~
   drivers/gpu/drm/vc4/vc4_kms.c:364:20: note: uninitialized use occurs here
     364 |                           VC4_SET_FIELD(mux, SCALER6_CONTROL_DSP1_TARGET));
         |                                         ^~~
   drivers/gpu/drm/vc4/vc4_regs.h:16:36: note: expanded from macro 'VC4_SET_FIELD'
      16 |                 WARN_ON(!FIELD_FIT(field##_MASK, value));               \
         |                                                  ^~~~~
   include/linux/bitfield.h:102:22: note: expanded from macro 'FIELD_FIT'
     102 |                 !((((typeof(_mask))_val) << __bf_shf(_mask)) & ~(_mask)); \
         |                                    ^~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_drv.h:668:10: note: expanded from macro 'HVS_WRITE'
     668 |                 writel(val, hvs->regs + (offset));                                      \
         |                        ^~~
   drivers/gpu/drm/vc4/vc4_kms.c:337:20: note: initialize the variable 'mux' to silence this warning
     337 |                 unsigned char mux;
         |                                  ^
         |                                   = '\0'
   14 warnings generated.
--
   In file included from drivers/gpu/drm/vc4/vc4_hvs.c:27:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_hvs.c:27:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_hvs.c:27:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/vc4/vc4_hvs.c:27:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/vc4/vc4_hvs.c:1489:20: warning: variable 'base' is uninitialized when used here [-Wuninitialized]
    1489 |                           VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
         |                                         ^~~~
   drivers/gpu/drm/vc4/vc4_regs.h:16:36: note: expanded from macro 'VC4_SET_FIELD'
      16 |                 WARN_ON(!FIELD_FIT(field##_MASK, value));               \
         |                                                  ^~~~~
   include/linux/bitfield.h:102:22: note: expanded from macro 'FIELD_FIT'
     102 |                 !((((typeof(_mask))_val) << __bf_shf(_mask)) & ~(_mask)); \
         |                                    ^~~~
   include/asm-generic/bug.h:123:25: note: expanded from macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/vc4/vc4_drv.h:668:10: note: expanded from macro 'HVS_WRITE'
     668 |                 writel(val, hvs->regs + (offset));                                      \
         |                        ^~~
   drivers/gpu/drm/vc4/vc4_hvs.c:1420:20: note: initialize the variable 'base' to silence this warning
    1420 |         u32 reg, top, base;
         |                           ^
         |                            = 0
>> drivers/gpu/drm/vc4/vc4_hvs.c:1489:6: error: call to '__compiletime_assert_756' declared with 'error' attribute: FIELD_PREP: value too large for the field
    1489 |                           VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
         |                           ^
   drivers/gpu/drm/vc4/vc4_regs.h:17:3: note: expanded from macro 'VC4_SET_FIELD'
      17 |                 FIELD_PREP(field##_MASK, value);                        \
         |                 ^
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^
   include/linux/bitfield.h:68:3: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:505:2: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:498:4: note: expanded from macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:40:1: note: expanded from here
      40 | __compiletime_assert_756
         | ^
   14 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +1489 drivers/gpu/drm/vc4/vc4_hvs.c

  1416	
  1417	static int vc4_hvs_cob_init(struct vc4_hvs *hvs)
  1418	{
  1419		struct vc4_dev *vc4 = hvs->vc4;
  1420		u32 reg, top, base;
  1421	
  1422		/*
  1423		 * Recompute Composite Output Buffer (COB) allocations for the
  1424		 * displays
  1425		 */
  1426		switch (vc4->gen) {
  1427		case VC4_GEN_4:
  1428			/* The COB is 20736 pixels, or just over 10 lines at 2048 wide.
  1429			 * The bottom 2048 pixels are full 32bpp RGBA (intended for the
  1430			 * TXP composing RGBA to memory), whilst the remainder are only
  1431			 * 24bpp RGB.
  1432			 *
  1433			 * Assign 3 lines to channels 1 & 2, and just over 4 lines to
  1434			 * channel 0.
  1435			 */
  1436			#define VC4_COB_SIZE		20736
  1437			#define VC4_COB_LINE_WIDTH	2048
  1438			#define VC4_COB_NUM_LINES	3
  1439			reg = 0;
  1440			top = VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
  1441			reg |= (top - 1) << 16;
  1442			HVS_WRITE(SCALER_DISPBASE2, reg);
  1443			reg = top;
  1444			top += VC4_COB_LINE_WIDTH * VC4_COB_NUM_LINES;
  1445			reg |= (top - 1) << 16;
  1446			HVS_WRITE(SCALER_DISPBASE1, reg);
  1447			reg = top;
  1448			top = VC4_COB_SIZE;
  1449			reg |= (top - 1) << 16;
  1450			HVS_WRITE(SCALER_DISPBASE0, reg);
  1451			break;
  1452	
  1453		case VC4_GEN_5:
  1454			/* The COB is 44416 pixels, or 10.8 lines at 4096 wide.
  1455			 * The bottom 4096 pixels are full RGBA (intended for the TXP
  1456			 * composing RGBA to memory), whilst the remainder are only
  1457			 * RGB. Addressing is always pixel wide.
  1458			 *
  1459			 * Assign 3 lines of 4096 to channels 1 & 2, and just over 4
  1460			 * lines. to channel 0.
  1461			 */
  1462			#define VC5_COB_SIZE		44416
  1463			#define VC5_COB_LINE_WIDTH	4096
  1464			#define VC5_COB_NUM_LINES	3
  1465			reg = 0;
  1466			top = VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
  1467			reg |= top << 16;
  1468			HVS_WRITE(SCALER_DISPBASE2, reg);
  1469			top += 16;
  1470			reg = top;
  1471			top += VC5_COB_LINE_WIDTH * VC5_COB_NUM_LINES;
  1472			reg |= top << 16;
  1473			HVS_WRITE(SCALER_DISPBASE1, reg);
  1474			top += 16;
  1475			reg = top;
  1476			top = VC5_COB_SIZE;
  1477			reg |= top << 16;
  1478			HVS_WRITE(SCALER_DISPBASE0, reg);
  1479			break;
  1480	
  1481		case VC4_GEN_6_C:
  1482			#define VC6_COB_LINE_WIDTH	3840
  1483			#define VC6_COB_NUM_LINES	4
  1484			reg = 0;
  1485			top = 3840;
  1486	
  1487			HVS_WRITE(SCALER6_DISP2_COB,
  1488				  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
> 1489				  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
  1490	
  1491			base = top + 16;
  1492			top += VC6_COB_LINE_WIDTH * VC6_COB_NUM_LINES;
  1493	
  1494			HVS_WRITE(SCALER6_DISP1_COB,
  1495				  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
  1496				  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
  1497	
  1498			base = top + 16;
  1499			top += VC6_COB_LINE_WIDTH * VC6_COB_NUM_LINES;
  1500	
  1501			HVS_WRITE(SCALER6_DISP0_COB,
  1502				  VC4_SET_FIELD(top, SCALER6_DISPX_COB_TOP) |
  1503				  VC4_SET_FIELD(base, SCALER6_DISPX_COB_BASE));
  1504			break;
  1505	
  1506		default:
  1507			return -EINVAL;
  1508		}
  1509	
  1510		return 0;
  1511	}
  1512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
