Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CA7ACE2E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 04:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F6110E1C2;
	Mon, 25 Sep 2023 02:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D7010E1C2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 02:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695609386; x=1727145386;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0Eie4tDSxJtzvtbLiXBv6OWMk2WPjKygPOluleJmGUc=;
 b=nYPjEO07kcyPxZuqJYjNQUM0Sw2lE3Wgjzo6pxoJWawTUSOKrKl+PDz2
 9+OiK0IAJUzHP8t3JzGF0HbZNEbhDYZZjiIBgb4v9658Gpouo+QATLqCA
 WazDI2AGUgAMUmP0HjLSCzFNh1/IBglFvRSHOnQoWqbXjnhzeAId/Cocf
 edkI5SP0rVd9mEwnorUsAdZ0H/8WGNqHQmyw5P3pVt5iaRNZfzbTDpybd
 nZFVErqggbv2EGOAinHcchGs3a7li6HBkgrMnLNJbtZTW3dd0ixu5B8pS
 mYheUY2LrGbAnJkSiggumtTkOW/+t8bqUQ863gGY/so6rn3g5Pk5ZDavy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445253836"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="445253836"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 19:36:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697832549"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="697832549"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 24 Sep 2023 19:36:22 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qkbSO-0000uc-04;
 Mon, 25 Sep 2023 02:36:20 +0000
Date: Mon, 25 Sep 2023 10:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 wens@csie.org
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Message-ID: <202309251030.rZTXXyFE-lkp@intel.com>
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
[also build test ERROR on v6.6-rc3 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jernej-Skrabec/drm-sun4i-dw-hdmi-Deinit-PHY-in-fail-path/20230925-032818
base:   linus/master
patch link:    https://lore.kernel.org/r/20230924192604.3262187-6-jernej.skrabec%40gmail.com
patch subject: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
config: parisc-randconfig-002-20230925 (https://download.01.org/0day-ci/archive/20230925/202309251030.rZTXXyFE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309251030.rZTXXyFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309251030.rZTXXyFE-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/gpu/drm/sun4i/sun8i_hdmi_phy.o: in function `sun8i_hdmi_phy_driver_init':
>> (.init.text+0x0): multiple definition of `init_module'; drivers/gpu/drm/sun4i/sun8i_dw_hdmi.o:(.init.text+0x0): first defined here
   hppa-linux-ld: drivers/gpu/drm/sun4i/sun8i_hdmi_phy.o: in function `sun8i_hdmi_phy_driver_exit':
>> (.exit.text+0x0): multiple definition of `cleanup_module'; drivers/gpu/drm/sun4i/sun8i_dw_hdmi.o:(.exit.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
