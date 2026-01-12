Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6A1D14C2C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 19:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3362D10E2B0;
	Mon, 12 Jan 2026 18:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fNVqGG21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792A410E111
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768242408; x=1799778408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4tX4yfMZLD9CinH/qL7aTz2HXhyLociwzo5T9q1Yp6E=;
 b=fNVqGG211/+HxCbYy5aGaKlTyNoTHyPMlTc4pgphexFQUMGb9aYZeJ5B
 5rO5zOPPhJvvJQJT/45ucrwaN0WL+zfpC8POZ/LYn/Osuk3sO2EMS8g0P
 qWJ0ndIrJ6/iwYrSzhpJFwL2LtUzYDLeGe41lLn6HlprberV3h13BhFH8
 akH2mq/Re1wir/GSF7wJHCIkynOfFSE7QAzF7XvUM45neeikKx/YcA4a4
 D6UohQpCA2+w29Z6sa4/SwI1Sho42AvzLX/YEikX0J5hEcxcl1uwdgCGu
 6S+qbd8xtjK9H5EAG1HHhcMkd5RMygAGkhN7EnEHADuvJW/ctpZjqgVgr Q==;
X-CSE-ConnectionGUID: l7ua9ZKPTYSl7dmoUEHD2A==
X-CSE-MsgGUID: 7+hCjep/QOKIWGAVDKwAYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69447449"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69447449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:26:48 -0800
X-CSE-ConnectionGUID: 4ETuplM6TSypTjzSJgZikA==
X-CSE-MsgGUID: CPf5HPlCTZa/DTGCHI6eTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="204175332"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 12 Jan 2026 10:26:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vfMck-00000000Dk0-30cu;
 Mon, 12 Jan 2026 18:26:42 +0000
Date: Tue, 13 Jan 2026 02:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
 Chintan Patel <chintanlike@gmail.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
Message-ID: <202601130116.rVB5C8Xx-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130116.rVB5C8Xx-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130116.rVB5C8Xx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130116.rVB5C8Xx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_setcolreg':
>> drivers/staging/fbtft/fbtft-core.c:367:30: error: implicit declaration of function 'dev_of_fbinfo'; did you mean 'dev_info'? [-Wimplicit-function-declaration]
     367 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^~~~~~~~~~~~~
         |                              dev_info
>> drivers/staging/fbtft/fbtft-core.c:367:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_blank':
   drivers/staging/fbtft/fbtft-core.c:393:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     393 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_register_framebuffer':
   drivers/staging/fbtft/fbtft-core.c:744:30: error: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     744 |         struct device *dev = dev_of_fbinfo(fb_info);
         |                              ^~~~~~~~~~~~~


vim +367 drivers/staging/fbtft/fbtft-core.c

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
