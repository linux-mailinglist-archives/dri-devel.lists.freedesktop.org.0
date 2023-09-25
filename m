Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9077ADD50
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 18:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74FA510E2A7;
	Mon, 25 Sep 2023 16:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F4010E2A7
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695660049; x=1727196049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=irBX2fasYwTUTHpDqrmJbVhDOEvr62Ct3dNu3hj8gtw=;
 b=Sllz4jYInlsUtVT9GfYHEeS5CPBYkQUT5Z5UwU4Sz1lYBn3ODfNbcf7z
 GVBXsoyTmLgC51wbaVqeoLBPcDYEV+Jn8GmYlCszPGGcW+ycBK7XjuuhT
 Ob91alLENKJ78DneOT1Mr5CgJWOxogz+K0yDaSsCdC6pY+K9YGF29KWDl
 0AUYPR3sgN597NDTMVQiLvF287/eD7z8elMSD8VMzPhT/19QLKU5CGTIm
 pkSMzG7sRuonEFe9I9idlXnnVm/hGf73tkk3mQR8RpjuicST4Rb10h1qH
 W1zGTW8FmrZf32TqWk5npphVb9Uzdu7soiSq5S3uY0uGlHvu/t1Q1tkbs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378582736"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="378582736"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 09:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751771015"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="751771015"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 09:40:45 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qkodU-0001o2-1r;
 Mon, 25 Sep 2023 16:40:41 +0000
Date: Tue, 26 Sep 2023 00:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 wens@csie.org
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Message-ID: <202309260027.aNIjQRBI-lkp@intel.com>
References: <20230924192604.3262187-6-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924192604.3262187-6-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jernej,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc3 next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jernej-Skrabec/drm-sun4i-dw-hdmi-Deinit-PHY-in-fail-path/20230925-032818
base:   linus/master
patch link:    https://lore.kernel.org/r/20230924192604.3262187-6-jernej.skrabec%40gmail.com
patch subject: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230926/202309260027.aNIjQRBI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260027.aNIjQRBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260027.aNIjQRBI-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/gpu/drm/sun4i/sun8i_hdmi_phy.o: in function `sun8i_hdmi_phy_driver_init':
>> sun8i_hdmi_phy.c:(.init.text+0x0): multiple definition of `init_module'; drivers/gpu/drm/sun4i/sun8i_dw_hdmi.o:sun8i_dw_hdmi.c:(.init.text+0x0): first defined here
   s390-linux-ld: drivers/gpu/drm/sun4i/sun8i_hdmi_phy.o: in function `sun8i_hdmi_phy_driver_exit':
>> sun8i_hdmi_phy.c:(.exit.text+0x0): multiple definition of `cleanup_module'; drivers/gpu/drm/sun4i/sun8i_dw_hdmi.o:sun8i_dw_hdmi.c:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
