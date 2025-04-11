Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07ADA85FEC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 16:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D1D10EBC8;
	Fri, 11 Apr 2025 14:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXZozda+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA66810EBCC
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744380259; x=1775916259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iXCJI7m7xgvcKn0BRQmCOU2n8OCNV7csusMxWXACsOo=;
 b=OXZozda+bFS3DwiQJ6O6ko8OudTG0v0fxhIPWb8ArloW3Sz1FHXObeYI
 p3fJhe63Z+BZG8bUQ+d/Eg/Ld7mgtZ6CGSAvH8AG+fBE/1hfzoSCpwOea
 rOgbDusi0jNXexnDtGPRGnm9haQASLH05VDIEyfMbQkNOSadh1pSBPLUY
 Rf0bQrf1VPfAex8NlVPYXXbwbuZKUFVkCkbmekLslTspoAS8aT0PKHbrf
 qMzRLgxzniT7FOwnlcaW+GRoEsJ2ku02UsSCoO+zQh8BHEAAUFulD5v/O
 pu0pyCfSreFt2QYxyAVXHTqDurxu+07qKlnO8KVZVzueGHgHSFx3BDf0h g==;
X-CSE-ConnectionGUID: UohNjBeaQmGCIIooEhsRUg==
X-CSE-MsgGUID: 4rnYaF6vTD229u1ZlhXA3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45819838"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="45819838"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 07:04:19 -0700
X-CSE-ConnectionGUID: 7ijj0isnTu+lupaetVaKRw==
X-CSE-MsgGUID: wxzYulREQbKT0gYTeC2zug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="130042139"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 11 Apr 2025 07:04:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u3EzP-000B8Q-2p;
 Fri, 11 Apr 2025 14:04:15 +0000
Date: Fri, 11 Apr 2025 22:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Jyri Sarha <jyri.sarha@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 2/6] drm/tilcdc: Allow build with COMPILE_TEST=y
Message-ID: <202504111847.8IHqTDBH-lkp@intel.com>
References: <20250410145904.25550-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410145904.25550-3-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.15-rc1 next-20250411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-tilcdc-Allow-build-without-__iowmb/20250410-230042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250410145904.25550-3-ville.syrjala%40linux.intel.com
patch subject: [PATCH v3 2/6] drm/tilcdc: Allow build with COMPILE_TEST=y
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250411/202504111847.8IHqTDBH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111847.8IHqTDBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111847.8IHqTDBH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_crtc.c:24:
   drivers/gpu/drm/tilcdc/tilcdc_regs.h: In function 'tilcdc_write64':
>> drivers/gpu/drm/tilcdc/tilcdc_regs.h:126:25: warning: passing argument 2 of 'iowrite64' discards 'volatile' qualifier from pointer target type [-Wdiscarded-qualifiers]
     126 |         iowrite64(data, addr);
         |                         ^~~~
   In file included from arch/alpha/include/asm/io.h:15,
                    from include/linux/scatterlist.h:9,
                    from include/linux/dma-mapping.h:8,
                    from drivers/gpu/drm/tilcdc/tilcdc_crtc.c:8:
   include/asm-generic/iomap.h:56:28: note: expected 'void *' but argument is of type 'volatile void *'
      56 | extern void iowrite64(u64, void __iomem *);
         |                            ^~~~~~~~~~~~~~


vim +126 drivers/gpu/drm/tilcdc/tilcdc_regs.h

16ea975eac671f Rob Clark       2013-01-08  119  
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  120  static inline void tilcdc_write64(struct drm_device *dev, u32 reg, u64 data)
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  121  {
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  122  	struct tilcdc_drm_private *priv = dev->dev_private;
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  123  	volatile void __iomem *addr = priv->mmio + reg;
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  124  
4e5ca2d930aa87 Logan Gunthorpe 2017-12-05  125  #if defined(iowrite64) && !defined(iowrite64_is_nonatomic)
7eb9f069ff5dd3 Jyri Sarha      2016-08-26 @126  	iowrite64(data, addr);
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  127  #else
752db4ea4759e8 Ville Syrjälä   2025-04-10  128  	/* allow compilation without __iowmb() for COMPILE_TEST */
752db4ea4759e8 Ville Syrjälä   2025-04-10  129  #ifdef __iowmb
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  130  	__iowmb();
752db4ea4759e8 Ville Syrjälä   2025-04-10  131  #endif
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  132  	/* This compiles to strd (=64-bit write) on ARM7 */
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  133  	*(volatile u64 __force *)addr = __cpu_to_le64(data);
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  134  #endif
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  135  }
7eb9f069ff5dd3 Jyri Sarha      2016-08-26  136  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
