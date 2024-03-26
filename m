Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80888C343
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 14:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3753110EF7E;
	Tue, 26 Mar 2024 13:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTsSTMkz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7AF10EF7E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711459250; x=1742995250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3zyWZJrkHBN9hkS0/xBCbFfBGF9h+0QSxzPI/J2yFg4=;
 b=CTsSTMkzPrKEOxj/H8CB/6NNockw43amJrvZ/l+Q8D6h2pvKqoAN8/1y
 SiPlUCcisTwSgo8ZM367G71h4NUBemaKAHiPNVBHO0daxWkfGT8k92OiA
 rzCFf2l5sToI0NGW5c6t2gWp++8Ec9q90JBjMRFxNOnRJdupCZxRXOegG
 vTNz0kniYtXDOk4/4ng9zM9tI1zlur01hPpiaO8wdCzkoesLlsW2wF6dD
 5h7IQ4JzpARAg4YXgGCD8LsBsRZ8p/x2pLzWC/bSnxoNu0IDk7q+4xf1J
 8qwBQK1gXm+SxPlLZ4+IefABnlD2cHfS+3D3E0DF7/lc04Q+sbSNRJLl3 Q==;
X-CSE-ConnectionGUID: hJkwSIrmSaWos26Ti3VJIw==
X-CSE-MsgGUID: VkeRcL6kQAm/6s0rQ+BpuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17651987"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17651987"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 06:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20657723"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 26 Mar 2024 06:20:47 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rp6jN-00004e-0h;
 Tue, 26 Mar 2024 13:20:45 +0000
Date: Tue, 26 Mar 2024 21:20:09 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 07/12] drm: Switch DRM_DISPLAY_HELPER to depends on
Message-ID: <202403262127.kZkttfNz-lkp@intel.com>
References: <20240325-kms-kconfig-helpers-v1-7-bfec6949d9c3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325-kms-kconfig-helpers-v1-7-bfec6949d9c3@kernel.org>
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

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5e842d55bad7794823a50f24fd645b58f2ef93ab]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-display-Make-DisplayPort-AUX-bus-Kconfig-name-consistent/20240325-205521
base:   5e842d55bad7794823a50f24fd645b58f2ef93ab
patch link:    https://lore.kernel.org/r/20240325-kms-kconfig-helpers-v1-7-bfec6949d9c3%40kernel.org
patch subject: [PATCH 07/12] drm: Switch DRM_DISPLAY_HELPER to depends on
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240326/202403262127.kZkttfNz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240326/202403262127.kZkttfNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403262127.kZkttfNz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/riscv/kvm/kvm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/btrfs/btrfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/xor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_deflate/zlib_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/virt-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/pcs/pcs_xpcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_obex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_ether.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ncm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_eem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm_subset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_rndis.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_mass_storage.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_fs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
>> ERROR: modpost: "drm_scdc_set_high_tmds_clock_ratio" [drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko] undefined!
>> ERROR: modpost: "drm_scdc_read" [drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko] undefined!
>> ERROR: modpost: "drm_scdc_write" [drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko] undefined!
>> ERROR: modpost: "drm_scdc_set_scrambling" [drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko] undefined!
>> ERROR: modpost: "drm_hdmi_infoframe_set_hdr_metadata" [drivers/gpu/drm/bridge/synopsys/dw-hdmi.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DW_HDMI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y] && DRM_DISPLAY_HELPER [=n]
   Selected by [m]:
   - DRM_SUN8I_DW_HDMI [=m] && HAS_IOMEM [=y] && DRM_SUN4I [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
