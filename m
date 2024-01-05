Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55201824E3B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 06:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B429110E0E8;
	Fri,  5 Jan 2024 05:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8A010E0E8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 05:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704433591; x=1735969591;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KVlQN+k+4yRFeF2dgIS0I2ZJD4MKgn9ZOQSqD0WwYQo=;
 b=jekaFofy8BhFjOrE8PkabfCS+h71qQvX1pncppPQh+HR3IcQP/yXSLAx
 gw2NOPC9RQ1ydDEXFk8xRTr8Rd+RNf9+H60IIwbZMuhYwN2pYVqcy3LL3
 oRrLDNRdB0e5KMBh2p9Muti1GG0uThxtW/ADz1hBz1HHaTNIx3bpl0FSH
 UrnI7mKX6h+fuA0BaI9Yj6rvzlDLh8iTljlKFYURAuWf0eEx5VhadX12l
 WCQeOGZJORJFmzU/pnCuVoBY8kAHBPCiOPBrqxdY6Ca+sO0fHgmmmsyU6
 Bi3KCdrsB2jh5J/KBz6sLDDnO4LEIP8NuafdvXh+CdkItMoZA7KmlYCa/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4544197"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="4544197"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 21:46:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871152519"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; d="scan'208";a="871152519"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2024 21:46:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rLd2G-0000pe-2m;
 Fri, 05 Jan 2024 05:46:24 +0000
Date: Fri, 5 Jan 2024 13:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Subject: Re: [PATCH v7 4/9] drm/panic: Add drm_panic_is_format_supported()
Message-ID: <202401051328.IW9dwjX4-lkp@intel.com>
References: <20240104160301.185915-5-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104160301.185915-5-jfalempe@redhat.com>
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 50a3c772bd927dd409c484832ddd9f6bf00b7389]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-format-helper-Add-drm_fb_blit_from_r1-and-drm_fb_fill/20240105-001038
base:   50a3c772bd927dd409c484832ddd9f6bf00b7389
patch link:    https://lore.kernel.org/r/20240104160301.185915-5-jfalempe%40redhat.com
patch subject: [PATCH v7 4/9] drm/panic: Add drm_panic_is_format_supported()
config: hexagon-randconfig-r071-20240105 (https://download.01.org/0day-ci/archive/20240105/202401051328.IW9dwjX4-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051328.IW9dwjX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051328.IW9dwjX4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/drm_drv.c:38:
   In file included from include/drm/drm_accel.h:11:
   In file included from include/drm/drm_file.h:39:
   In file included from include/drm/drm_prime.h:37:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_drv.c:46:
>> include/drm/drm_panic.h:97:6: warning: no previous prototype for function 'drm_panic_is_format_supported' [-Wmissing-prototypes]
      97 | bool drm_panic_is_format_supported(u32 format) {return false; }
         |      ^
   include/drm/drm_panic.h:97:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      97 | bool drm_panic_is_format_supported(u32 format) {return false; }
         | ^
         | static 
   7 warnings generated.


vim +/drm_panic_is_format_supported +97 include/drm/drm_panic.h

    96	
  > 97	bool drm_panic_is_format_supported(u32 format) {return false; }
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
