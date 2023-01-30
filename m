Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C75B681AB4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 20:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8EF10E10E;
	Mon, 30 Jan 2023 19:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9848F10E10E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 19:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675107801; x=1706643801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=03AWtZ13nFWnK3DbtYbpEVJ2rzGSXBvw9WpxIDybsMY=;
 b=JL1RmPzZfrZExBdzCdQnzg2LOsP0AO2YjGUCupaaq+54hnoQfB/F8srW
 xFmdc3hh7zYMyRd3SRi7pVC1HYHIirY8YYsKNdGtmsOPpbDvrP22IN0VA
 kyHS6NctBp8+d/++YLxJlq2KNpX/olD5CgHnS128dqR5RY2g8HTZxmPkf
 pi/heJKTBeDe5lRrYP1ud35x7alf89JNKZgq7sCV8EjfrXGNMap4V74zj
 YkT25xfEOKUFh7Re+xgGfDSNg17ioEK+ETfasbKAYEFYDbGywmoLhiIhe
 Lr6bRcTo8hJWevnkvoaedN4ZXOBCxTjU7Fj3K0noc2iezMiW/VR0o+4by g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327676270"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="327676270"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 11:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806810662"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="806810662"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 11:43:18 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pMa3h-0003s2-3B;
 Mon, 30 Jan 2023 19:43:17 +0000
Date: Tue, 31 Jan 2023 03:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
 airlied@redhat.com, daniel@ffwll.ch, jonathanh@nvidia.com
Subject: Re: [PATCH 2/2] drm/tegra: add scanout support for implicit tiling
 parameters
Message-ID: <202301310334.4oiy5KGY-lkp@intel.com>
References: <20230120105858.214440-3-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120105858.214440-3-diogo.ivo@tecnico.ulisboa.pt>
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
Cc: linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Diogo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on drm/drm-next tegra-drm/drm/tegra/for-next linus/master v6.2-rc6 next-20230130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Diogo-Ivo/drm-tegra-add-sector-layout-to-SET-GET_TILING-IOCTLs/20230120-190334
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20230120105858.214440-3-diogo.ivo%40tecnico.ulisboa.pt
patch subject: [PATCH 2/2] drm/tegra: add scanout support for implicit tiling parameters
config: arm64-randconfig-r016-20230130 (https://download.01.org/0day-ci/archive/20230131/202301310334.4oiy5KGY-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/fffef2135ccf679112cc60dee0532494c1389c78
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Diogo-Ivo/drm-tegra-add-sector-layout-to-SET-GET_TILING-IOCTLs/20230120-190334
        git checkout fffef2135ccf679112cc60dee0532494c1389c78
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/tegra/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/tegra/fb.c:149:4: error: expected expression
                           unsigned long height = planes[0]->tiling.value;
                           ^
>> drivers/gpu/drm/tegra/fb.c:151:8: error: use of undeclared identifier 'height'
                           if (height > 5) {
                               ^
>> drivers/gpu/drm/tegra/fb.c:151:8: error: use of undeclared identifier 'height'
>> drivers/gpu/drm/tegra/fb.c:151:8: error: use of undeclared identifier 'height'
   drivers/gpu/drm/tegra/fb.c:153:6: error: use of undeclared identifier 'height'
                                           height);
                                           ^
   drivers/gpu/drm/tegra/fb.c:159:49: error: use of undeclared identifier 'height'
                           modifier = DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(height);
                                                                        ^
   6 errors generated.


vim +149 drivers/gpu/drm/tegra/fb.c

   110	
   111	static struct drm_framebuffer *tegra_fb_alloc(struct drm_device *drm,
   112						      const struct drm_mode_fb_cmd2 *mode_cmd,
   113						      struct tegra_bo **planes,
   114						      unsigned int num_planes)
   115	{
   116		struct drm_framebuffer *fb;
   117		unsigned int i;
   118		int err;
   119		struct drm_mode_fb_cmd2 mode_cmd_local;
   120	
   121		fb = kzalloc(sizeof(*fb), GFP_KERNEL);
   122		if (!fb)
   123			return ERR_PTR(-ENOMEM);
   124	
   125		/* Check for implicitly defined modifiers using
   126		 * the state defined by tegra_gem_set_tiling().
   127		 */
   128		if (!(mode_cmd->flags & DRM_MODE_FB_MODIFIERS)) {
   129			uint64_t modifier;
   130	
   131			mode_cmd_local = *mode_cmd;
   132	
   133			switch (planes[0]->tiling.mode) {
   134			case TEGRA_BO_TILING_MODE_PITCH:
   135				modifier = DRM_FORMAT_MOD_LINEAR;
   136				break;
   137	
   138			case TEGRA_BO_TILING_MODE_TILED:
   139				modifier = DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED;
   140				break;
   141	
   142			/* With all rigour this reconstruction of the modifier is
   143			 * incomplete, as it skips some fields (like page kind).
   144			 * However, along with the sector layout below it should
   145			 * contain all the bits of information needed by the
   146			 * scanout hardware.
   147			 */
   148			case TEGRA_BO_TILING_MODE_BLOCK:
 > 149				unsigned long height = planes[0]->tiling.value;
   150	
 > 151				if (height > 5) {
   152					dev_err(drm->dev, "invalid block height value: %ld\n",
   153						height);
   154	
   155					err = -EINVAL;
   156					goto cleanup;
   157				}
   158	
   159				modifier = DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(height);
   160				break;
   161	
   162			default:
   163				dev_err(drm->dev, "invalid tiling mode\n");
   164				err = -EINVAL;
   165				goto cleanup;
   166			}
   167	
   168			if (planes[0]->tiling.sector_layout == DRM_TEGRA_GEM_SECTOR_LAYOUT_GPU)
   169				modifier |= DRM_FORMAT_MOD_NVIDIA_SECTOR_LAYOUT;
   170	
   171			mode_cmd_local.modifier[0] = modifier;
   172	
   173			mode_cmd = &mode_cmd_local;
   174		}
   175	
   176		drm_helper_mode_fill_fb_struct(drm, fb, mode_cmd);
   177	
   178		for (i = 0; i < fb->format->num_planes; i++)
   179			fb->obj[i] = &planes[i]->gem;
   180	
   181		err = drm_framebuffer_init(drm, fb, &tegra_fb_funcs);
   182		if (err < 0) {
   183			dev_err(drm->dev, "failed to initialize framebuffer: %d\n",
   184				err);
   185			goto cleanup;
   186		}
   187	
   188		return fb;
   189	
   190	cleanup:
   191		kfree(fb);
   192		return ERR_PTR(err);
   193	}
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
