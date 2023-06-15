Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14CC73224C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468F010E554;
	Thu, 15 Jun 2023 22:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D0F10E554
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686866456; x=1718402456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/DBKpHCZOe8HcbwIKY+6OcZWYK0x1Sli1ATyqhdAGec=;
 b=S81kY3eRk79YcdqKcSDOsy7WokoOaPT79QTWsATgY3wUttO152d9vZFV
 lmcP9G2yH12uw/aA9A0kDVP/QUfJFgLlCl0FsB2YId7eaLDVRHOE6tNrp
 ateVzPM6u6aJECrTDX9WDZ3xc2nj/zp5mdTfBx5vQjHUBULpGoig1ujsn
 hqDZkd6YqsA9l3P2vyDh/jcUJs17LkAzYNuxDTAv5vI8o9YRR9iLbc55e
 +5IxwQWAkdZvLzy0jfE7J3phK68TsCbLOrQBRAOoXkF3RNf9YE4QcU9Al
 UBF1Wyw+saL+lLWhJuH19LG2EnfVbkFz7ECWCIr3y7T1xD8/PAVlBAl9o Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="338669745"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="338669745"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 15:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825471887"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="825471887"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2023 15:00:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q9v1P-0000Qp-1P;
 Thu, 15 Jun 2023 22:00:51 +0000
Date: Fri, 16 Jun 2023 05:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Arthur Grillo <arthurgrillo@riseup.net>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/vkms: Add support to 1D gamma LUT
Message-ID: <202306160524.qcbF0KNr-lkp@intel.com>
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
 rodrigosiqueiramelo@gmail.com, xaver.hugl@gmail.com, victoria@system76.com,
 mwen@igalia.com, mairacanal@riseup.net, mdaenzer@redhat.com, jadahl@redhat.com,
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230616/202306160524.qcbF0KNr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/gpu/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306160524.qcbF0KNr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vkms/vkms_crtc.c: In function 'vkms_crtc_atomic_flush':
>> drivers/gpu/drm/vkms/vkms_crtc.c:251:32: warning: variable 'gamma_lut' set but not used [-Wunused-but-set-variable]
     251 |         struct vkms_color_lut *gamma_lut;
         |                                ^~~~~~~~~


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
