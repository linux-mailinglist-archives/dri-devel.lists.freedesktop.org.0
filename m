Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB69BDB36
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 02:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B30A10E15A;
	Wed,  6 Nov 2024 01:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONtD99Gr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D5510E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 01:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730856660; x=1762392660;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=w4uRAgM8xbGcWtcxv849nFQ4mF6NuoUMjhUqN7BpOZE=;
 b=ONtD99GrBf25+rM34KqHUwiiwURJm/oah1vLGcWaIc5uQ35/pb8qi8bk
 m32DKNOLqFNO0G1UE38es+/jeRiiG2FSdhTn5QJ20y4RaariVeN/uBFcu
 7GNO9SJPGq1kHva5k2UKCo0MNlysf+CTJDpdPM83y8ZogbMGBY8ifnqFJ
 B6VZm7Y0cZBH2l62hclJA8GycLUGFIxUaeBauGxOXBWX4bGs9/w21FEdB
 xq9wwsQpqByCrRLpItYG9tyL0vDW4gQeHdQL0fyDl+BJCl8Yx8vruioCa
 uCkzhgp8GU9o3bUvocDy/Vxd6UMKOoKf3GnSUbEkGe9oet0J+NEaGaHgk w==;
X-CSE-ConnectionGUID: xEV6TWMlRuKgQyreIpfo/g==
X-CSE-MsgGUID: Mj7M2x3FRJaspUDd5O4y7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53201958"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53201958"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 17:30:59 -0800
X-CSE-ConnectionGUID: 4L7Ct1tFSgaMWkNvEsRxBQ==
X-CSE-MsgGUID: +Z+xLsTLRoWY1bWMap8SKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="84347612"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 05 Nov 2024 17:30:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t8Usn-000mhP-1q;
 Wed, 06 Nov 2024 01:30:53 +0000
Date: Wed, 6 Nov 2024 09:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v6 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <202411060951.mK9Fi0fi-lkp@intel.com>
References: <20241105125109.226866-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105125109.226866-3-jfalempe@redhat.com>
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

Hi Jocelyn,

kernel test robot noticed the following build errors:

[auto build test ERROR on d78f0ee0406803cda8801fd5201746ccf89e5e4a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-Move-drawing-functions-to-drm_draw/20241105-205432
base:   d78f0ee0406803cda8801fd5201746ccf89e5e4a
patch link:    https://lore.kernel.org/r/20241105125109.226866-3-jfalempe%40redhat.com
patch subject: [PATCH v6 2/6] drm/log: Introduce a new boot logger to draw the kmsg on the screen
config: hexagon-randconfig-002-20241106 (https://download.01.org/0day-ci/archive/20241106/202411060951.mK9Fi0fi-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060951.mK9Fi0fi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060951.mK9Fi0fi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_client_setup
   >>> referenced by komeda_drv.c:87 (drivers/gpu/drm/arm/display/komeda/komeda_drv.c:87)
   >>>               drivers/gpu/drm/arm/display/komeda/komeda_drv.o:(komeda_platform_probe) in archive vmlinux.a
   >>> referenced by komeda_drv.c:87 (drivers/gpu/drm/arm/display/komeda/komeda_drv.c:87)
   >>>               drivers/gpu/drm/arm/display/komeda/komeda_drv.o:(komeda_platform_probe) in archive vmlinux.a
   >>> referenced by vkms_drv.c:230 (drivers/gpu/drm/vkms/vkms_drv.c:230)
   >>>               drivers/gpu/drm/vkms/vkms_drv.o:(vkms_init) in archive vmlinux.a
   >>> referenced 23 more times
--
>> ld.lld: error: undefined symbol: drm_client_setup_with_fourcc
   >>> referenced by arcpgu.c:399 (drivers/gpu/drm/tiny/arcpgu.c:399)
   >>>               drivers/gpu/drm/tiny/arcpgu.o:(arcpgu_probe) in archive vmlinux.a
   >>> referenced by arcpgu.c:399 (drivers/gpu/drm/tiny/arcpgu.c:399)
   >>>               drivers/gpu/drm/tiny/arcpgu.o:(arcpgu_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
