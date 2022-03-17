Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23124DCFDD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 21:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A9110E787;
	Thu, 17 Mar 2022 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5883210E787
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 20:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647550709; x=1679086709;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qiRi8XlUIbrbR9T3kuSAb1/evSzc2yMr2lWLZocnUl4=;
 b=eklHE48jmdqffgODwdWCVr6ZU0vn/FEqQwLKZzE7cPp5b8B6R99Zbqrp
 lzkGHzvP1VOV+PAO58BHtgCOAsez8khRqBs1pVz18qD1MwLLiM0BYRvo3
 GlUcilswwsse2Omtb1atsHhBa+MM5rUL48MkBdGAn88SUv5YqaEN2/9Jr
 x/FPjtY5VKsSWfwRYHiGUZ/irntZOHdxRFqfxuBZUb6Mx+EmgXJDHbuOn
 b1tlcbe4IAr6ZYms4cVBrPNtn1mh20pxbu6q1viXxmNhAZyManPo0HOco
 HhwJBo2dbfpFp1YuE5z5n+b+cBIXDSQP8HI8fm0akLtxk1n1MhIebVsXY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254536892"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="254536892"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 13:58:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="715192458"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 17 Mar 2022 13:58:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUxCF-000E5N-EZ; Thu, 17 Mar 2022 20:58:11 +0000
Date: Fri, 18 Mar 2022 04:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/gma500: Remove unused declarations and other cruft
Message-ID: <202203180409.kj2q4cgM-lkp@intel.com>
References: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: daniel.vetter@ffwll.ch, kbuild-all@lists.01.org, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Patrik,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc8 next-20220317]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220318/202203180409.kj2q4cgM-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/0d50efabcb4ad52bd7a036e2542dbf51bbcf93b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Patrik-Jakobsson/drm-gma500-Remove-unused-declarations-and-other-cruft/20220317-172741
        git checkout 0d50efabcb4ad52bd7a036e2542dbf51bbcf93b4
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/gma500/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/gma500/psb_drv.c:102:6: warning: no previous prototype for 'psb_spank' [-Wmissing-prototypes]
     102 | void psb_spank(struct drm_psb_private *dev_priv)
         |      ^~~~~~~~~


vim +/psb_spank +102 drivers/gpu/drm/gma500/psb_drv.c

5c49fd3aa0ab02 Alan Cox         2011-11-03   95  
5c209d8056b976 Patrik Jakobsson 2021-02-01   96  /**
5c209d8056b976 Patrik Jakobsson 2021-02-01   97   *	psb_spank		-	reset the 2D engine
5c209d8056b976 Patrik Jakobsson 2021-02-01   98   *	@dev_priv: our PSB DRM device
5c209d8056b976 Patrik Jakobsson 2021-02-01   99   *
5c209d8056b976 Patrik Jakobsson 2021-02-01  100   *	Soft reset the graphics engine and then reload the necessary registers.
5c209d8056b976 Patrik Jakobsson 2021-02-01  101   */
5c209d8056b976 Patrik Jakobsson 2021-02-01 @102  void psb_spank(struct drm_psb_private *dev_priv)
5c209d8056b976 Patrik Jakobsson 2021-02-01  103  {
5c209d8056b976 Patrik Jakobsson 2021-02-01  104  	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
5c209d8056b976 Patrik Jakobsson 2021-02-01  105  		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
5c209d8056b976 Patrik Jakobsson 2021-02-01  106  		_PSB_CS_RESET_ISP_RESET | _PSB_CS_RESET_TSP_RESET |
5c209d8056b976 Patrik Jakobsson 2021-02-01  107  		_PSB_CS_RESET_TWOD_RESET, PSB_CR_SOFT_RESET);
5c209d8056b976 Patrik Jakobsson 2021-02-01  108  	PSB_RSGX32(PSB_CR_SOFT_RESET);
5c209d8056b976 Patrik Jakobsson 2021-02-01  109  
5c209d8056b976 Patrik Jakobsson 2021-02-01  110  	msleep(1);
5c209d8056b976 Patrik Jakobsson 2021-02-01  111  
5c209d8056b976 Patrik Jakobsson 2021-02-01  112  	PSB_WSGX32(0, PSB_CR_SOFT_RESET);
5c209d8056b976 Patrik Jakobsson 2021-02-01  113  	wmb();
5c209d8056b976 Patrik Jakobsson 2021-02-01  114  	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) | _PSB_CB_CTRL_CLEAR_FAULT,
5c209d8056b976 Patrik Jakobsson 2021-02-01  115  		   PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  116  	wmb();
5c209d8056b976 Patrik Jakobsson 2021-02-01  117  	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  118  
5c209d8056b976 Patrik Jakobsson 2021-02-01  119  	msleep(1);
5c209d8056b976 Patrik Jakobsson 2021-02-01  120  	PSB_WSGX32(PSB_RSGX32(PSB_CR_BIF_CTRL) & ~_PSB_CB_CTRL_CLEAR_FAULT,
5c209d8056b976 Patrik Jakobsson 2021-02-01  121  		   PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  122  	(void) PSB_RSGX32(PSB_CR_BIF_CTRL);
5c209d8056b976 Patrik Jakobsson 2021-02-01  123  	PSB_WSGX32(dev_priv->gtt.gatt_start, PSB_CR_BIF_TWOD_REQ_BASE);
5c209d8056b976 Patrik Jakobsson 2021-02-01  124  }
5c209d8056b976 Patrik Jakobsson 2021-02-01  125  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
