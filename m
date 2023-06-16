Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353FE732564
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 04:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5716E10E58A;
	Fri, 16 Jun 2023 02:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A67010E58A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686883810; x=1718419810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GCBi7WKbYqqXi/HvNdaR3un8/Yj937XeVlGfrtAkTUk=;
 b=YvjP3oYhX/jEHwfjh14N58BjYxMTpKFPjUvU3Wcdsk7/MEb3e2Zw5rMC
 AdIWPNa1k4plfskKGEyJI2bLCEx9MP2Z4Hi4edUrPZiAVlL3NJAEYj1uh
 2pUf0ColHQ3WMHu+5U5fd8KZsa6gMCvZLjeU5Khrye31B4GWJTQJxL29A
 wWgoJj10Qg+X/enWTr0CiXgFL62wvrZciGpvZcU9Skzwn4qRw6yxJiz3K
 bSByiObNkXed5NxDstyUgKjIyN6XPOLUP2Z1YHYvqar45UAH0suaYJEHD
 4IyAdZXoIMY7Ju7eys3G4gv6J7hZBIrXnD1iH33+YVaxq8+XO7XyfaPcb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="357974045"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; d="scan'208";a="357974045"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 19:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782722269"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; d="scan'208";a="782722269"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2023 19:50:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q9zXI-0000iv-1I;
 Fri, 16 Jun 2023 02:50:04 +0000
Date: Fri, 16 Jun 2023 10:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/vkms: Add support to 1D gamma LUT
Message-ID: <202306161055.oBAa9NF1-lkp@intel.com>
References: <20230615200157.960630-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615200157.960630-1-arthurgrillo@riseup.net>
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, pekka.paalanen@collabora.com,
 rodrigosiqueiramelo@gmail.com, llvm@lists.linux.dev, xaver.hugl@gmail.com,
 victoria@system76.com, mwen@igalia.com, mairacanal@riseup.net,
 mdaenzer@redhat.com, jadahl@redhat.com,
 Arthur Grillo <arthurgrillo@riseup.net>, oe-kbuild-all@lists.linux.dev,
 sebastian.wick@redhat.com, andrealmeid@riseup.net, uma.shankar@intel.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arthur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.4-rc6 next-20230615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arthur-Grillo/drm-vkms-Add-support-to-1D-gamma-LUT/20230616-040349
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230615200157.960630-1-arthurgrillo%40riseup.net
patch subject: [PATCH v3] drm/vkms: Add support to 1D gamma LUT
config: x86_64-randconfig-r022-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161055.oBAa9NF1-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch drm-misc drm-misc-next
        git checkout drm-misc/drm-misc-next
        b4 shazam https://lore.kernel.org/r/20230615200157.960630-1-arthurgrillo@riseup.net
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/vkms/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161055.oBAa9NF1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_crtc.c:251:25: warning: variable 'gamma_lut' set but not used [-Wunused-but-set-variable]
           struct vkms_color_lut *gamma_lut;
                                  ^
   1 warning generated.


vim +/gamma_lut +251 drivers/gpu/drm/vkms/vkms_crtc.c

   246	
   247	static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
   248					   struct drm_atomic_state *state)
   249	{
   250		struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
 > 251		struct vkms_color_lut *gamma_lut;
   252	
   253		if (crtc->state->event) {
   254			spin_lock(&crtc->dev->event_lock);
   255	
   256			if (drm_crtc_vblank_get(crtc) != 0)
   257				drm_crtc_send_vblank_event(crtc, crtc->state->event);
   258			else
   259				drm_crtc_arm_vblank_event(crtc, crtc->state->event);
   260	
   261			spin_unlock(&crtc->dev->event_lock);
   262	
   263			crtc->state->event = NULL;
   264		}
   265	
   266		vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
   267		gamma_lut = &vkms_output->composer_state->gamma_lut;
   268	
   269		spin_unlock_irq(&vkms_output->lock);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
