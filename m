Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7974D9727
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 10:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06D810E9A5;
	Tue, 15 Mar 2022 09:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3F610E9A5;
 Tue, 15 Mar 2022 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647335303; x=1678871303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BOGkV1R9jATnmy60k4Z2w/p9Ncg9ruX8vcR8NretwAE=;
 b=CKHIaCmeINnoJeSihLk1V6Juxmt9SE83IBD/40FRVYCIpIBNC3jPZCB2
 OOj9DhwPFpD5Y+eY/fQH9RddymnnExRm1F7bcnOT9Uns1NmPtCSIZa6IE
 3RcCre7PIAmX6cnJOCTPF2tol2ObqTNQMf8D1AzyTdpuHZIMgX6SB2X1u
 BHAuMOk+XlUxAEHGGNtRSyVjLdM50u6wpA3ceKQ49/C1zMyPXZvVzIMmm
 c831sgdSLzVc6LUG4oVdgUPpNDhTpjxYI3X5cwslAwfgcKB//xBwGJI94
 GLejyj0kY889Odpzb7dhdbzexIXiqLftKricF091ZObhnJz1/FkAvqqg3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342679456"
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="342679456"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 02:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,182,1643702400"; d="scan'208";a="634518597"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2022 02:08:19 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nU3AA-000AmE-Hz; Tue, 15 Mar 2022 09:08:18 +0000
Date: Tue, 15 Mar 2022 17:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/disp/dpu1: add inline rotation support for
 sc7280 target
Message-ID: <202203151751.ov7gCUZI-lkp@intel.com>
References: <1647319394-11426-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647319394-11426-1-git-send-email-quic_vpolimer@quicinc.com>
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
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next next-20220310]
[cannot apply to tegra-drm/drm/tegra/for-next airlied/drm-next v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vinod-Polimera/drm-msm-disp-dpu1-add-inline-rotation-support-for-sc7280-target/20220315-124423
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-buildonly-randconfig-r002-20220313 (https://download.01.org/0day-ci/archive/20220315/202203151751.ov7gCUZI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6b2f50fb47da3baeee10b1906da6e30ac5d26ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1582b1f4a0b79f64b61b217ea6c3bb0591da0fab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vinod-Polimera/drm-msm-disp-dpu1-add-inline-rotation-support-for-sc7280-target/20220315-124423
        git checkout 1582b1f4a0b79f64b61b217ea6c3bb0591da0fab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/

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

5334087ee7438fa Loic Poulain               2022-02-14  647  
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  648  /*************************************************************
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  649   * SSPP sub blocks config
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  650   *************************************************************/
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  651  
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  652  /* SSPP common configuration */
1582b1f4a0b79f6 Vinod Polimera             2022-03-15  653  #define _VIG_SBLK(num, sdma_pri, qseed_ver, rot_cfg) \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  654  	{ \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  655  	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  656  	.maxupscale = MAX_UPSCALE_RATIO, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  657  	.smart_dma_priority = sdma_pri, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  658  	.src_blk = {.name = STRCAT("sspp_src_", num), \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  659  		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  660  	.scaler_blk = {.name = STRCAT("sspp_scaler", num), \
b75ab05a34792fc Shubhashree Dhar           2019-11-27  661  		.id = qseed_ver, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  662  		.base = 0xa00, .len = 0xa0,}, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  663  	.csc_blk = {.name = STRCAT("sspp_csc", num), \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  664  		.id = DPU_SSPP_CSC_10BIT, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  665  		.base = 0x1a00, .len = 0x100,}, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  666  	.format_list = plane_formats_yuv, \
e6b63a7bb6cd9cd Fritz Koenig               2018-12-11  667  	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  668  	.virt_format_list = plane_formats, \
e6b63a7bb6cd9cd Fritz Koenig               2018-12-11  669  	.virt_num_formats = ARRAY_SIZE(plane_formats), \
1582b1f4a0b79f6 Vinod Polimera             2022-03-15  670  	.rotation_cfg = rot_cfg, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  671  	}
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  672  
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  673  #define _DMA_SBLK(num, sdma_pri) \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  674  	{ \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  675  	.maxdwnscale = SSPP_UNITY_SCALE, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  676  	.maxupscale = SSPP_UNITY_SCALE, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  677  	.smart_dma_priority = sdma_pri, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  678  	.src_blk = {.name = STRCAT("sspp_src_", num), \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  679  		.id = DPU_SSPP_SRC, .base = 0x00, .len = 0x150,}, \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  680  	.format_list = plane_formats, \
e6b63a7bb6cd9cd Fritz Koenig               2018-12-11  681  	.num_formats = ARRAY_SIZE(plane_formats), \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  682  	.virt_format_list = plane_formats, \
e6b63a7bb6cd9cd Fritz Koenig               2018-12-11  683  	.virt_num_formats = ARRAY_SIZE(plane_formats), \
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  684  	}
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  685  
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13 @686  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =
1582b1f4a0b79f6 Vinod Polimera             2022-03-15  687  				_VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3, NULL);
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13 @688  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =
1582b1f4a0b79f6 Vinod Polimera             2022-03-15  689  				_VIG_SBLK("1", 0, DPU_SSPP_SCALER_QSEED3, NULL);
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13 @690  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_2 =
1582b1f4a0b79f6 Vinod Polimera             2022-03-15  691  				_VIG_SBLK("2", 0, DPU_SSPP_SCALER_QSEED3, NULL);
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13 @692  static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =
1582b1f4a0b79f6 Vinod Polimera             2022-03-15  693  				_VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3, NULL);
1582b1f4a0b79f6 Vinod Polimera             2022-03-15  694  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
