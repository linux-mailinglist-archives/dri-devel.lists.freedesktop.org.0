Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 895746F44E5
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 15:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7017410E298;
	Tue,  2 May 2023 13:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E9F10E298
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683033628; x=1714569628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5MA4pkcgt8W4MuoPb0tpe5rk1Xt3o5u3PJ7rZD+vUXA=;
 b=DNPCrxA9hQTiNCiiA1oU5Alomuf2OcuyY9inRVODmdNrvq7yOZNkW+hc
 lbb7KFEJG57OuNbnA8hgoq8KKl8D6WLX+k6BGJe39j+U9Yq/8cPxX5nzN
 q+rgT6aH/0fZtLukmaM9my733qffrgJoQfkg5+9r8ya5aj7KRfihCTtaT
 oz2U/tgfTtU5XSgu8RmaTFbWEyXU2vgo9SapIhQS5lzGKxDt+7UUTJElo
 yQICjN/+lDJAQHVTik/FU1BzsNvcQtQjl3429h8vdKWPcbuijXIb+LXjQ
 82FML4LNh32LqXVvIC1S5LUbE49eT1y16o7mbBtgzd8MeqQG6FGZmRWgq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="347211428"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="347211428"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 06:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="690280647"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="690280647"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 02 May 2023 06:20:25 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ptpvc-000148-1i;
 Tue, 02 May 2023 13:20:24 +0000
Date: Tue, 2 May 2023 21:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Subject: Re: [PATCH 06/11] drm/mediatek: gamma: Use bitfield macros
Message-ID: <202305022108.9tmu3iyy-lkp@intel.com>
References: <20230502081650.25947-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502081650.25947-7-angelogioacchino.delregno@collabora.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3 next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230502-161758
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230502081650.25947-7-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH 06/11] drm/mediatek: gamma: Use bitfield macros
config: arm-randconfig-r006-20230501 (https://download.01.org/0day-ci/archive/20230502/202305022108.9tmu3iyy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/171ab0605a0c2b44167dc1339b29dc80c2ac7d4d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review AngeloGioacchino-Del-Regno/drm-mediatek-gamma-Adjust-mtk_drm_gamma_set_common-parameters/20230502-161758
        git checkout 171ab0605a0c2b44167dc1339b29dc80c2ac7d4d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305022108.9tmu3iyy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:111:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
                                  ^
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c:124:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
                                  ^
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c:132:13: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
                      ^
   drivers/gpu/drm/mediatek/mtk_disp_gamma.c:151:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           sz = FIELD_PREP(DISP_GAMMA_SIZE_HSIZE, w);
                ^
   4 errors generated.


vim +/FIELD_PREP +111 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

    77	
    78	void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
    79	{
    80		struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
    81		unsigned int i;
    82		struct drm_color_lut *lut;
    83		void __iomem *lut_base;
    84		bool lut_diff;
    85		u16 lut_size;
    86		u32 cfg_val, word;
    87	
    88		/* If there's no gamma lut there's nothing to do here. */
    89		if (!state->gamma_lut)
    90			return;
    91	
    92		if (gamma && gamma->data) {
    93			lut_diff = gamma->data->lut_diff;
    94			lut_size = gamma->data->lut_size;
    95		} else {
    96			lut_diff = false;
    97			lut_size = LUT_SIZE_DEFAULT;
    98		}
    99	
   100		cfg_val = readl(regs + DISP_GAMMA_CFG);
   101		lut_base = regs + DISP_GAMMA_LUT;
   102		lut = (struct drm_color_lut *)state->gamma_lut->data;
   103		for (i = 0; i < lut_size; i++) {
   104			struct drm_color_lut diff, hwlut;
   105	
   106			hwlut.red = drm_color_lut_extract(lut[i].red, LUT_BITS_DEFAULT);
   107			hwlut.green = drm_color_lut_extract(lut[i].green, LUT_BITS_DEFAULT);
   108			hwlut.red = drm_color_lut_extract(lut[i].blue, LUT_BITS_DEFAULT);
   109	
   110			if (!lut_diff || (i % 2 == 0)) {
 > 111				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
   112				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
   113				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
   114			} else {
   115				diff.red = lut[i].red - lut[i - 1].red;
   116				diff.red = drm_color_lut_extract(diff.red, LUT_BITS_DEFAULT);
   117	
   118				diff.green = lut[i].green - lut[i - 1].green;
   119				diff.green = drm_color_lut_extract(diff.green, LUT_BITS_DEFAULT);
   120	
   121				diff.blue = lut[i].blue - lut[i - 1].blue;
   122				diff.blue = drm_color_lut_extract(diff.blue, LUT_BITS_DEFAULT);
   123	
   124				word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
   125				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
   126				word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
   127			}
   128			writel(word, (lut_base + i * 4));
   129		}
   130	
   131		/* Enable the gamma table */
   132		cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
   133	
   134		writel(cfg_val, regs + DISP_GAMMA_CFG);
   135	}
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
