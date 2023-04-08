Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3686DB8C0
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 06:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF5610E0B5;
	Sat,  8 Apr 2023 04:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63B10E0B5;
 Sat,  8 Apr 2023 04:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680926981; x=1712462981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I85LnZNyBLif63Nt+7CkFxtYuaxsLLp2R4nv7/uIJo0=;
 b=eDf+4NykiCKc+xnJkuhj7vHHWhmFDeRyqv27Dk4U9OWqntm1hku3gG1S
 p+ywMp4PhLEh9bz/1gUMCYrhghxuJRCAk2NKk4k8LZW6jegkwFd6Hdbui
 GnkW4EoA7mvu8AYjLEofFTgF8RZGZDLFZV/wtX2XjNXPb9r000n6LHwcz
 OZ2Zqj/JHBPDiKMgHARmSTnkvewB6Ey61NKenOmCufizuC4NkBVRgrn2S
 kQZCpD3G4R6MPp5kACOQV8wYCsQe0Gx1GkA4XdLPUOZ5dIJIAVntKjB8+
 mN14iNfVp7eGbnqHU+Ukvb7vPV5wLHEDzBUcDLYiqoUW+2FZ9j8dX4xO5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="341861522"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="341861522"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 21:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="831368603"
X-IronPort-AV: E=Sophos;i="5.98,328,1673942400"; d="scan'208";a="831368603"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2023 21:09:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pkztH-000TIP-1p;
 Sat, 08 Apr 2023 04:09:27 +0000
Date: Sat, 8 Apr 2023 12:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for
 reading IOR state
Message-ID: <202304081129.AMXCmyn2-lkp@intel.com>
References: <20230407222133.1425969-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407222133.1425969-2-lyude@redhat.com>
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
Cc: Kees Cook <keescook@chromium.org>, Karol Herbst <kherbst@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>, llvm@lists.linux.dev,
 open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/drm-nouveau-kms-Add-INHERIT-ioctl-to-nvkm-nvif-for-reading-IOR-state/20230408-062329
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230407222133.1425969-2-lyude%40redhat.com
patch subject: [PATCH 2/2] drm/nouveau/kms: Add INHERIT ioctl to nvkm/nvif for reading IOR state
config: arm64-buildonly-randconfig-r001-20230403 (https://download.01.org/0day-ci/archive/20230408/202304081129.AMXCmyn2-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a3d963915cf6f2d87b57146f7bc57a6a89d90cf6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lyude-Paul/drm-nouveau-kms-Add-INHERIT-ioctl-to-nvkm-nvif-for-reading-IOR-state/20230408-062329
        git checkout a3d963915cf6f2d87b57146f7bc57a6a89d90cf6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081129.AMXCmyn2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv50/disp.c:2554:1: warning: no previous prototype for function 'nv50_display_read_hw_state' [-Wmissing-prototypes]
   nv50_display_read_hw_state(struct nouveau_drm *drm)
   ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2553:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2618:1: warning: no previous prototype for function 'nv50_display_create' [-Wmissing-prototypes]
   nv50_display_create(struct drm_device *dev)
   ^
   drivers/gpu/drm/nouveau/dispnv50/disp.c:2617:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int
   ^
   static 
   2 warnings generated.


vim +/nv50_display_read_hw_state +2554 drivers/gpu/drm/nouveau/dispnv50/disp.c

  2551	
  2552	/* Read back the currently programmed display state */
  2553	void
> 2554	nv50_display_read_hw_state(struct nouveau_drm *drm)
  2555	{
  2556		struct drm_device *dev = drm->dev;
  2557		struct drm_encoder *encoder;
  2558		struct drm_modeset_acquire_ctx ctx;
  2559		struct nv50_disp *disp = nv50_disp(dev);
  2560		int ret;
  2561	
  2562		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
  2563	
  2564		drm_for_each_encoder(encoder, dev) {
  2565			if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
  2566				continue;
  2567	
  2568			nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
  2569		}
  2570	
  2571		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
  2572	}
  2573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
