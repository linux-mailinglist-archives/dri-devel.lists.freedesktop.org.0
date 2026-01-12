Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C820D11B65
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E818110E08D;
	Mon, 12 Jan 2026 10:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iMoT2UhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB85710E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 10:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768212376; x=1799748376;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3PW+lccnBZa1wwf7a30nZMPulFc55qZnM/4SokkMUr8=;
 b=iMoT2UhPPahCeESX4nEcnFIg+ZsdimkqRbt1rx4EdJtjio0r95w076HS
 aflcRSvGNma0GQB/+LZ8zeS0gU9W6UFt8Erk4zAQnOlp7DaPeG7GG6JAe
 BcqW4VYI+C0pLv6n2MAkJ4NS57exfA3uhLPtgHYp2U175jHH89QSYZq2/
 vpWs4FiOklJb7pMXL7MhCp+WAe/y8oKuP0QQvXiroPmX12qDLZnDLAVDL
 J34k5x2oppMWiv0lhU3c/JCdflGDrIMABQX3icbUu9vxj6kMZpURfyjlL
 ou5i6lJzPmsrcjXJ6C6NSJgoS6H7aMZkDUa4pRVlTrR+UXSeYo1kmlL+h w==;
X-CSE-ConnectionGUID: 6zfnxFcZS+C1bh9V3PyyOw==
X-CSE-MsgGUID: dCD8mwUNQgetKy+uoQoBxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="57034231"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="57034231"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 02:06:15 -0800
X-CSE-ConnectionGUID: JWYITz9qRL2wHgPvTI3OEA==
X-CSE-MsgGUID: Fl4ph0OrQhmwRKYcLvXrkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="203264499"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 02:06:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vfEoM-00000000DF6-03aY;
 Mon, 12 Jan 2026 10:06:10 +0000
Date: Mon, 12 Jan 2026 18:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
Message-ID: <202601121705.2kgxpvsS-lkp@intel.com>
References: <20260112010740.186248-1-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112010740.186248-1-chintanlike@gmail.com>
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

Hi Chintan,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Chintan-Patel/staging-fbtft-use-dev_of_fbinfo-instead-of-info-dev/20260112-091221
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260112010740.186248-1-chintanlike%40gmail.com
patch subject: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
config: x86_64-randconfig-005-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121705.2kgxpvsS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121705.2kgxpvsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121705.2kgxpvsS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-core.c:367:23: error: call to undeclared function 'dev_of_fbinfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^
>> drivers/staging/fbtft/fbtft-core.c:367:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     367 |         struct device *dev = dev_of_fbinfo(info);
         |                        ^     ~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c:393:23: error: call to undeclared function 'dev_of_fbinfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     393 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^
   drivers/staging/fbtft/fbtft-core.c:393:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     393 |         struct device *dev = dev_of_fbinfo(info);
         |                        ^     ~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c:744:23: error: call to undeclared function 'dev_of_fbinfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     744 |         struct device *dev = dev_of_fbinfo(fb_info);
         |                              ^
   drivers/staging/fbtft/fbtft-core.c:744:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     744 |         struct device *dev = dev_of_fbinfo(fb_info);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/dev_of_fbinfo +367 drivers/staging/fbtft/fbtft-core.c

   360	
   361	static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
   362				      unsigned int green, unsigned int blue,
   363				      unsigned int transp, struct fb_info *info)
   364	{
   365		unsigned int val;
   366		int ret = 1;
 > 367		struct device *dev = dev_of_fbinfo(info);
   368	
   369		dev_dbg(dev,
   370			"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
   371			__func__, regno, red, green, blue, transp);
   372	
   373		switch (info->fix.visual) {
   374		case FB_VISUAL_TRUECOLOR:
   375			if (regno < 16) {
   376				u32 *pal = info->pseudo_palette;
   377	
   378				val  = chan_to_field(red,   &info->var.red);
   379				val |= chan_to_field(green, &info->var.green);
   380				val |= chan_to_field(blue,  &info->var.blue);
   381	
   382				pal[regno] = val;
   383				ret = 0;
   384			}
   385			break;
   386		}
   387		return ret;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
