Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A51AE2DFF
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jun 2025 04:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0307410E0CD;
	Sun, 22 Jun 2025 02:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kx/Cqo/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5087710E0CD
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 02:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750558977; x=1782094977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=smT81ZGikL0XcHJsLT8lEppkH+fN2eauAFmorGIVhYQ=;
 b=kx/Cqo/kcPuC5ZeiUQmum3CqKJhJgANG7IuacplbcWv9lyXPGI5pD0LX
 UIm6YDG+sKKoATg3MyyDFBfzvLqP9D/yr6WZJh3+CK5jfOPbMm8jHjB+F
 03Kxr4YWJSr1mty9V2BavFRJJBe4VbZVYnWtCOSJYha1H7HCjpl4CT4R3
 k2jolfhdJI6J2vO8bDgxj1TsOyUXzq/lx3xJtWcqkUz5erzYP/ymdh1zN
 0bTg7CBY75vFhy7B53y3iqXwYLck5NMd17olNseVhMaXJW2WB4ydFMDYl
 U6frNIEZ7Om7Uw59Sl2ZwJ+b3lrsbWdPDs3oIMzwogz8JGgDr+YhGeKft g==;
X-CSE-ConnectionGUID: EHuSQzZNRwuHPlCvWQDItw==
X-CSE-MsgGUID: kAlxkm/CSKuiN3Z+qoiYPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="51895310"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; d="scan'208";a="51895310"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2025 19:22:50 -0700
X-CSE-ConnectionGUID: r9sRgp3PR7evIMRC0XykFQ==
X-CSE-MsgGUID: jWAxPm+4Qau9LxeZXkF/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; d="scan'208";a="182127439"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa001.fm.intel.com with ESMTP; 21 Jun 2025 19:22:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uTAM0-000MzG-1C;
 Sun, 22 Jun 2025 02:22:44 +0000
Date: Sun, 22 Jun 2025 10:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
Message-ID: <202506221019.ooLo1xBw-lkp@intel.com>
References: <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-simple-drm-fb-icc-v1-3-d92142e8f74f@fairphone.com>
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

Hi Luca,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Weiss/dt-bindings-display-simple-framebuffer-Add-interconnects-property/20250620-183302
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250620-simple-drm-fb-icc-v1-3-d92142e8f74f%40fairphone.com
patch subject: [PATCH 3/3] fbdev/simplefb: Add support for interconnect paths
config: sparc-randconfig-r063-20250622 (https://download.01.org/0day-ci/archive/20250622/202506221019.ooLo1xBw-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506221019.ooLo1xBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506221019.ooLo1xBw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/simplefb.c: In function 'simplefb_detach_icc':
>> drivers/video/fbdev/simplefb.c:542:14: error: 'struct simplefb_par' has no member named 'icc_count'
     542 |  for (i = par->icc_count - 1; i >= 0; i--) {
         |              ^~
>> drivers/video/fbdev/simplefb.c:543:26: error: 'struct simplefb_par' has no member named 'icc_paths'
     543 |   if (!IS_ERR_OR_NULL(par->icc_paths[i]))
         |                          ^~
   drivers/video/fbdev/simplefb.c:544:15: error: 'struct simplefb_par' has no member named 'icc_paths'
     544 |    icc_put(par->icc_paths[i]);
         |               ^~
   drivers/video/fbdev/simplefb.c: In function 'simplefb_attach_icc':
   drivers/video/fbdev/simplefb.c:564:5: error: 'struct simplefb_par' has no member named 'icc_count'
     564 |  par->icc_count = count / 2;
         |     ^~
   drivers/video/fbdev/simplefb.c:566:5: error: 'struct simplefb_par' has no member named 'icc_paths'
     566 |  par->icc_paths = devm_kcalloc(dev, par->icc_count,
         |     ^~
   drivers/video/fbdev/simplefb.c:566:40: error: 'struct simplefb_par' has no member named 'icc_count'
     566 |  par->icc_paths = devm_kcalloc(dev, par->icc_count,
         |                                        ^~
   drivers/video/fbdev/simplefb.c:567:22: error: 'struct simplefb_par' has no member named 'icc_paths'
     567 |           sizeof(*par->icc_paths),
         |                      ^~
   drivers/video/fbdev/simplefb.c:569:10: error: 'struct simplefb_par' has no member named 'icc_paths'
     569 |  if (!par->icc_paths)
         |          ^~
   drivers/video/fbdev/simplefb.c:572:21: error: 'struct simplefb_par' has no member named 'icc_count'
     572 |  for (i = 0; i < par->icc_count; i++) {
         |                     ^~
   drivers/video/fbdev/simplefb.c:573:6: error: 'struct simplefb_par' has no member named 'icc_paths'
     573 |   par->icc_paths[i] = of_icc_get_by_index(dev, i);
         |      ^~
   drivers/video/fbdev/simplefb.c:574:25: error: 'struct simplefb_par' has no member named 'icc_paths'
     574 |   if (IS_ERR_OR_NULL(par->icc_paths[i])) {
         |                         ^~
   drivers/video/fbdev/simplefb.c:575:21: error: 'struct simplefb_par' has no member named 'icc_paths'
     575 |    ret = PTR_ERR(par->icc_paths[i]);
         |                     ^~
   drivers/video/fbdev/simplefb.c:582:23: error: 'struct simplefb_par' has no member named 'icc_paths'
     582 |   ret = icc_set_bw(par->icc_paths[i], 0, UINT_MAX);
         |                       ^~
   drivers/video/fbdev/simplefb.c:594:26: error: 'struct simplefb_par' has no member named 'icc_paths'
     594 |   if (!IS_ERR_OR_NULL(par->icc_paths[i]))
         |                          ^~
   drivers/video/fbdev/simplefb.c:595:15: error: 'struct simplefb_par' has no member named 'icc_paths'
     595 |    icc_put(par->icc_paths[i]);
         |               ^~


vim +542 drivers/video/fbdev/simplefb.c

   532	
   533	#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
   534	/*
   535	 * Generic interconnect path handling code.
   536	 */
   537	static void simplefb_detach_icc(void *res)
   538	{
   539		struct simplefb_par *par = res;
   540		int i;
   541	
 > 542		for (i = par->icc_count - 1; i >= 0; i--) {
 > 543			if (!IS_ERR_OR_NULL(par->icc_paths[i]))
   544				icc_put(par->icc_paths[i]);
   545		}
   546	}
   547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
