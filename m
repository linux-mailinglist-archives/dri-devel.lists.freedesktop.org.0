Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CD85206BB
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 23:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657A310F2D4;
	Mon,  9 May 2022 21:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1460510F2D3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 21:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652132281; x=1683668281;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4ro9ql15BLhrTmeok9yadR63yNmc4qb+qAbU3by+dsU=;
 b=atw9WpRNLEjPffUI8/wZK3mDv3gdM23f/BPItmmIMYJpVteszIO/eGsg
 PBOMJ0ZQj2bEr8mn+/apVY8N58Jz+6NHRdO+PH5QUgvWE0OJHf0VGUMXr
 SOOwkQ7Bp6adPF8N9r6yHquPWHWc36M/iT05xodL4iV9z9ny4A/0si+TE
 x/RbJo+1J7FBDkXVndPRUQgyibcr9OBjGM6QNODAMjzTQvEWnEAD3ePXF
 kzlALOZwT3CoRigcPJn5ZqRnCE6hqmzyxxwl7hO0ZDMW5M/CYa+lYeAjE
 1j1Qoubc4cSBzHjqUoEX+z7CI/GEMB4hNyq4hhl69yvR603K7b9OTYopw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355604760"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="355604760"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 14:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; d="scan'208";a="710717069"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 09 May 2022 14:37:58 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1noB4o-000Gvw-Bm;
 Mon, 09 May 2022 21:37:58 +0000
Date: Tue, 10 May 2022 05:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com, tzimmermann@suse.de
Subject: Re: [PATCH] mgag200: Enable atomic gamma lut update
Message-ID: <202205100516.IJQ7MRHW-lkp@intel.com>
References: <20220509094930.44613-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509094930.44613-1-jfalempe@redhat.com>
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
Cc: michel@daenzer.net, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tegra-drm/drm/tegra/for-next]
[also build test ERROR on v5.18-rc6]
[cannot apply to drm/drm-next drm-tip/drm-tip airlied/drm-next next-20220509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/mgag200-Enable-atomic-gamma-lut-update/20220509-175430
base:   git://anongit.freedesktop.org/tegra/linux.git drm/tegra/for-next
config: mips-randconfig-r015-20220509 (https://download.01.org/0day-ci/archive/20220510/202205100516.IJQ7MRHW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c0e0a39a5acd3aa9d0cd6f25679bd16930233491
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jocelyn-Falempe/mgag200-Enable-atomic-gamma-lut-update/20220509-175430
        git checkout c0e0a39a5acd3aa9d0cd6f25679bd16930233491
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/mgag200/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mgag200/mgag200_mode.c:97:3: error: void function 'mga_crtc_update_lut' should not return a value [-Wreturn-type]
                   return
                   ^
   1 error generated.


vim +/mga_crtc_update_lut +97 drivers/gpu/drm/mgag200/mgag200_mode.c

    88	
    89	static void mga_crtc_update_lut(struct mga_device *mdev,
    90					struct drm_crtc_state *state,
    91					u8 depth)
    92	{
    93		struct drm_color_lut * lut;
    94		int i;
    95		
    96		if (!state->color_mgmt_changed || !state->gamma_lut)
  > 97			return
    98	
    99		lut = (struct drm_color_lut *) state->gamma_lut->data;
   100		WREG8(DAC_INDEX + MGA1064_INDEX, 0);
   101	
   102		if (depth == 15) {
   103			/* 16 bits r5g5b5a1 */
   104			for (i = 0; i < MGAG200_LUT_SIZE; i += 8) {
   105				WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
   106				WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
   107				WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
   108			}
   109		} else if (depth == 16) {
   110			/* 16 bits r5g6b5, as green has one more bit, 
   111			 * add padding with 0 for red and blue. */
   112			for (i = 0; i < MGAG200_LUT_SIZE; i += 4) {
   113				u8 red = 2 * i < MGAG200_LUT_SIZE ? lut[2 * i].red >> 8 : 0;
   114				u8 blue = 2 * i < MGAG200_LUT_SIZE ? lut[2 * i].red >> 8 : 0;
   115				WREG8(DAC_INDEX + MGA1064_COL_PAL, red);
   116				WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
   117				WREG8(DAC_INDEX + MGA1064_COL_PAL, blue);
   118			}
   119		} else {
   120			/* 24 bits r8g8b8 */
   121			for (i = 0; i < MGAG200_LUT_SIZE; i++) {
   122				WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].red >> 8);
   123				WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].green >> 8);
   124				WREG8(DAC_INDEX + MGA1064_COL_PAL, lut[i].blue >> 8);
   125			}
   126		}
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
