Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AA9687465
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 05:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D751F10E0F0;
	Thu,  2 Feb 2023 04:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF74F10E0F0;
 Thu,  2 Feb 2023 04:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675311794; x=1706847794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jRjDoncShj8+SssxokKgsGrrecQq1hGkUGW2vyCqEh0=;
 b=UANfDHhxCQuGbKePnFUAefodDR+/fh2cFQfYB6DHHoftuyGap3TT/nno
 y+2YuBiBurBrvbs1kyrqVLlaGHvBEnV+pgMPmtxVRc0rjaxNB/y3/Kt5U
 xXEJnwZU7Q/P920ig8DD02qcC+aIn2N/ey4/yPdx1NQ1QRAZY90+ftt2a
 5NRPtVTLeWwgS74eihSO12R9VDqLxsws77aehAwQiWwp0lAb//fXxZM/X
 5jqrWqQfhDcj3SKrEQtWlFIU+4stvivfM0GoFwXJ4V5OJuNwabiv3O3ye
 wmdQnk7v1/NDXy15pxkGTvj0Zv3ntqqzia93wS4GRZbclf+43btq1zdPO w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="311992910"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="311992910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 20:23:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="642736779"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; d="scan'208";a="642736779"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 01 Feb 2023 20:23:09 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pNR7s-00068m-34;
 Thu, 02 Feb 2023 04:23:08 +0000
Date: Thu, 2 Feb 2023 12:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kalyan Thota <quic_kalyant@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [v1 3/3] drm/msm/disp/dpu1: reserve the resources on topology
 change
Message-ID: <202302021238.o9yx7MKs-lkp@intel.com>
References: <1675092092-26412-4-git-send-email-quic_kalyant@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675092092-26412-4-git-send-email-quic_kalyant@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 quic_abhinavk@quicinc.com, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dianders@chromium.org, oe-kbuild-all@lists.linux.dev,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 swboyd@chromium.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kalyan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.2-rc6 next-20230201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalyan-Thota/drm-msm-disp-dpu1-clear-dspp-reservations-in-rm-release/20230130-232224
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/1675092092-26412-4-git-send-email-quic_kalyant%40quicinc.com
patch subject: [v1 3/3] drm/msm/disp/dpu1: reserve the resources on topology change
config: riscv-randconfig-r042-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021238.o9yx7MKs-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/4c49c3233fc18f3b746a96b5ff4ce5008da3bfec
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kalyan-Thota/drm-msm-disp-dpu1-clear-dspp-reservations-in-rm-release/20230130-232224
        git checkout 4c49c3233fc18f3b746a96b5ff4ce5008da3bfec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:2091:6: error: conflicting types for 'dpu_encoder_prepare_commit'
   void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
        ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h:155:6: note: previous declaration is here
   void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc,
        ^
   1 error generated.
--
>> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:443:38: error: too few arguments to function call, expected 2, have 1
                           dpu_encoder_prepare_commit(encoder);
                           ~~~~~~~~~~~~~~~~~~~~~~~~~~        ^
   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h:155:6: note: 'dpu_encoder_prepare_commit' declared here
   void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc,
        ^
   1 error generated.


vim +/dpu_encoder_prepare_commit +2091 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

ae4d721ce10057a Abhinav Kumar     2022-04-26  2090  
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27 @2091  void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2092  {
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2093  	struct dpu_encoder_virt *dpu_enc;
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2094  	struct dpu_encoder_phys *phys;
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2095  	int i;
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2096  
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2097  	if (!drm_enc) {
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2098  		DPU_ERROR("invalid encoder\n");
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2099  		return;
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2100  	}
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2101  	dpu_enc = to_dpu_encoder_virt(drm_enc);
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2102  
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2103  	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2104  		phys = dpu_enc->phys_encs[i];
b6fadcade627040 Drew Davenport    2019-12-06  2105  		if (phys->ops.prepare_commit)
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2106  			phys->ops.prepare_commit(phys);
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2107  	}
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2108  }
25fdd5933e4c0f5 Jeykumar Sankaran 2018-06-27  2109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
