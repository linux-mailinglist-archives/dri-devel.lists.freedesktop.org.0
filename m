Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BE4DA6B6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 01:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F82010E156;
	Wed, 16 Mar 2022 00:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8C110E156;
 Wed, 16 Mar 2022 00:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647389425; x=1678925425;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pMWxEWmxHHX9naqSDiuc2Bhsw44WtfdV77oMDvXnZWs=;
 b=VowDZA6/J/VLnPuOYgSLMyIXHDMnS0sTjnkfhnQiNeOi6Z8Nmg0fJuTa
 lpMSmZ3EsBDvX8/ATUcFfepzpMw2qvzpcuvIGjyfqyZcSQTFAdFj9C6mJ
 9SCD7mEn1vkKBfVTOLr3Zs+LwxV0B1Q8aUPihARpGFJDYund/chQawk/N
 Ni0/8dfEWWWeZpjXxevDYm1Tngz0askRFLwwzIgTFObvDbkL+4IuZklol
 4W6/OmDd3KrSb5EVqVK4XSxK7IqLOMNc0cX0s2RoU7JmJWG1D90eJW7Y7
 HbitT+8bGTdxmAu+97aIvkjZBRvjLRJ3y9/0lqxKduMupCe9INa8YYW73 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="238617097"
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="238617097"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 17:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,185,1643702400"; d="scan'208";a="512811510"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 15 Mar 2022 17:10:21 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUHF6-000Bfm-Qj; Wed, 16 Mar 2022 00:10:20 +0000
Date: Wed, 16 Mar 2022 08:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5] drm/msm/disp/dpu1: add inline rotation support for
 sc7280 target
Message-ID: <202203160707.7oltHMuz-lkp@intel.com>
References: <1647338841-24485-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647338841-24485-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, kbuild-all@lists.01.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinod,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next next-20220315]
[cannot apply to tegra-drm/drm/tegra/for-next v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vinod-Polimera/drm-msm-disp-dpu1-add-inline-rotation-support-for-sc7280-target/20220315-180939
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r033-20220313 (https://download.01.org/0day-ci/archive/20220316/202203160707.7oltHMuz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/4bb118c6c8461459d9ebce2ccbb07b6096a1a202
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vinod-Polimera/drm-msm-disp-dpu1-add-inline-rotation-support-for-sc7280-target/20220315-180939
        git checkout 4bb118c6c8461459d9ebce2ccbb07b6096a1a202
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:686:39: warning: unused variable 'msm8998_vig_sblk_0' [-Wunused-const-variable]
   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
                                         ^
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:688:39: warning: unused variable 'msm8998_vig_sblk_1' [-Wunused-const-variable]
   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
                                         ^
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:690:39: warning: unused variable 'msm8998_vig_sblk_2' [-Wunused-const-variable]
   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
                                         ^
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:692:39: warning: unused variable 'msm8998_vig_sblk_3' [-Wunused-const-variable]
   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
                                         ^
   4 warnings generated.


vim +/msm8998_vig_sblk_0 +686 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

5334087ee7438f Loic Poulain               2022-02-14  647  
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  648  /*************************************************************
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  649   * SSPP sub blocks config
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  650   *************************************************************/
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  651  
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  652  /* SSPP common configuration */
4bb118c6c84614 Vinod Polimera             2022-03-15  653  #define _VIG_SBLK(num, sdma_pri, qseed_ver, rot_cfg) \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  654  	{ \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  655  	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  656  	.maxupscale = MAX_UPSCALE_RATIO, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  657  	.smart_dma_priority = sdma_pri, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  658  	.src_blk = {.name = STRCAT("sspp_src_", num), \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  659  		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  660  	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
b75ab05a34792f Shubhashree Dhar           2019-11-27  661  		.id = qseed_ver, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  662  		.base = 0xa00, .len = 0xa0,}, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  663  	.csc_blk = {.name = STRCAT("sspp_csc", num), \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  664  		.id = DPU_SSPP_CSC_10BIT, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  665  		.base = 0x1a00, .len = 0x100,}, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  666  	.format_list = plane_formats_yuv, \
e6b63a7bb6cd9c Fritz Koenig               2018-12-11  667  	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  668  	.virt_format_list = plane_formats, \
e6b63a7bb6cd9c Fritz Koenig               2018-12-11  669  	.virt_num_formats = ARRAY_SIZE(plane_formats), \
4bb118c6c84614 Vinod Polimera             2022-03-15  670  	.rotation_cfg = rot_cfg, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  671  	}
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  672  
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  673  #define _DMA_SBLK(num, sdma_pri) \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  674  	{ \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  675  	.maxdwnscale = SSPP_UNITY_SCALE, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  676  	.maxupscale = SSPP_UNITY_SCALE, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  677  	.smart_dma_priority = sdma_pri, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  678  	.src_blk = {.name = STRCAT("sspp_src_", num), \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  679  		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  680  	.format_list = plane_formats, \
e6b63a7bb6cd9c Fritz Koenig               2018-12-11  681  	.num_formats = ARRAY_SIZE(plane_formats), \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  682  	.virt_format_list = plane_formats, \
e6b63a7bb6cd9c Fritz Koenig               2018-12-11  683  	.virt_num_formats = ARRAY_SIZE(plane_formats), \
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  684  	}
25fdd5933e4c0f Jeykumar Sankaran          2018-06-27  685  
94391a14fc2738 AngeloGioacchino Del Regno 2022-01-13 @686  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
4bb118c6c84614 Vinod Polimera             2022-03-15  687  				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3, NULL);
94391a14fc2738 AngeloGioacchino Del Regno 2022-01-13 @688  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
4bb118c6c84614 Vinod Polimera             2022-03-15  689  				_VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3, NULL);
94391a14fc2738 AngeloGioacchino Del Regno 2022-01-13 @690  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
4bb118c6c84614 Vinod Polimera             2022-03-15  691  				_VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3, NULL);
94391a14fc2738 AngeloGioacchino Del Regno 2022-01-13 @692  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
4bb118c6c84614 Vinod Polimera             2022-03-15  693  				_VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3, NULL);
4bb118c6c84614 Vinod Polimera             2022-03-15  694  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
