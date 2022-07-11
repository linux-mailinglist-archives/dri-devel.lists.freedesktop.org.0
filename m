Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE55570BC6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0BA91066;
	Mon, 11 Jul 2022 20:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A0B91062
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657571444; x=1689107444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eIsTB0Pt504SFh4kF57CTygGapGxny7sePVJFDogJlk=;
 b=Uu/GkhRBpku8k9O6b2nWGkCEpGIcVpPVZkdVvYkvwBszRFInzeqZFP6J
 1Ue0e9+sp497BIselEXNLtiBEI8Ns7cxHZh8gEUR6UA0omlHF1KeMdb6H
 gp6rT0nAhmQ4GeIPpWxuz+dcdL99+Tu7knssyByFWGbmTwVyV57la8R+a
 YrV8SJclh/Cwo40P0JUrQnEgJyqLklkmomgvaNg85deJ1gCybCjvKdwWL
 anOIsSn5Elq4d9pvagDsL0BXTbv33TocSk+4UQWfWK8fuDicAA/7ugTzP
 itJJwmuHWqciTFFuDOuQuVvSJnfFlBU/D1sz+nfAvPEhkQhmUCERq5m40 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="282314816"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="282314816"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 13:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; d="scan'208";a="721727476"
Received: from lkp-server02.sh.intel.com (HELO 8708c84be1ad) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 11 Jul 2022 13:30:41 -0700
Received: from kbuild by 8708c84be1ad with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oB03E-0001CZ-GO;
 Mon, 11 Jul 2022 20:30:40 +0000
Date: Tue, 12 Jul 2022 04:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chenyang Li <lichenyang@loongson.cn>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 devel@linuxdriverproject.org
Subject: Re: [PATCH v7 3/4] drm/loongson: Add interrupt driver for LS7A.
Message-ID: <202207120454.PJBS1e9p-lkp@intel.com>
References: <20220625090715.3663-3-lichenyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625090715.3663-3-lichenyang@loongson.cn>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chenyang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v5.19-rc6 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chenyang-Li/drm-loongson-Add-DRM-Driver-for-Loongson-7A1000-bridge-chip/20220625-171037
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220712/202207120454.PJBS1e9p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 77a38f6839980bfac61babb40d83772c51427011)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7cad653ee3a3b83188e2d91335269753e134b808
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chenyang-Li/drm-loongson-Add-DRM-Driver-for-Loongson-7A1000-bridge-chip/20220625-171037
        git checkout 7cad653ee3a3b83188e2d91335269753e134b808
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/loongson/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/loongson/loongson_irq.c:24:11: warning: variable 'lcrtc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           else if (val & FB_VSYNC1_INT)
                    ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/loongson_irq.c:27:26: note: uninitialized use occurs here
           drm_crtc_handle_vblank(&lcrtc->base);
                                   ^~~~~
   drivers/gpu/drm/loongson/loongson_irq.c:24:7: note: remove the 'if' if its condition is always true
           else if (val & FB_VSYNC1_INT)
                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/loongson/loongson_irq.c:16:29: note: initialize the variable 'lcrtc' to silence this warning
           struct loongson_crtc *lcrtc;
                                      ^
                                       = NULL
   1 warning generated.


vim +24 drivers/gpu/drm/loongson/loongson_irq.c

    11	
    12	static irqreturn_t loongson_irq_handler(int irq, void *arg)
    13	{
    14		struct drm_device *dev = (struct drm_device *) arg;
    15		struct loongson_device *ldev = to_loongson_device(dev);
    16		struct loongson_crtc *lcrtc;
    17		u32 val;
    18	
    19		val = ls7a_mm_rreg(ldev, FB_INT_REG);
    20		ls7a_mm_wreg(ldev, FB_INT_REG, val & (0xffff << 16));
    21	
    22		if (val & FB_VSYNC0_INT)
    23			lcrtc = ldev->mode_info[0].crtc;
  > 24		else if (val & FB_VSYNC1_INT)
    25			lcrtc = ldev->mode_info[1].crtc;
    26	
    27		drm_crtc_handle_vblank(&lcrtc->base);
    28	
    29		return IRQ_HANDLED;
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
