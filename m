Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AE54D1869
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C8210E2AC;
	Tue,  8 Mar 2022 12:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBE510E2AC;
 Tue,  8 Mar 2022 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646744127; x=1678280127;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NYrXls5pr28/YqLnwHsHfZyvhY0KcSAOepllwzDc9VE=;
 b=Sn5ROj6GppYD5aF0NnCCPmmA59/EyD1skTfsx+PAqMG+x6xQSrNpr4OJ
 vPgk5agL/Sj54wdBPSm8rXf9VssVDmuKgjC7MqT2korH8ACy/t+HWFSwh
 ctrncaeNQg6O70H2ejJ1qyh7n2Wad4Wvt9xFnH3hb5KdJTB0N2+ylqzrk
 xyFENNwbKKNZnS5+wb9aYuMQtkEfFuGPosaouXJZyokjrBn7J43FkZqql
 14SKo4FrIs9yvaJJXGD4TyeWfiFUZmsgSLcoRuVPkv3eNK1Ly1YSROayz
 0/vAkMekJPeewcttNUZYcz4U6TDc9N579RPBXujyVyIO8cEmiUtqKmcQy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254865663"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="254865663"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 04:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="610995763"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2022 04:55:22 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRZN3-0001Ou-Qn; Tue, 08 Mar 2022 12:55:21 +0000
Date: Tue, 8 Mar 2022 20:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v1 02/10] drm/msm/a6xx: Send NMI to gmu when it is hung
Message-ID: <202203082018.IcI00Nvs-lkp@intel.com>
References: <20220302225551.v1.2.Icda301aa85f1e4367601fa9b830b3365d377e669@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302225551.v1.2.Icda301aa85f1e4367601fa9b830b3365d377e669@changeid>
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
Cc: Douglas Anderson <dianders@chromium.org>, kbuild-all@lists.01.org,
 Dan Carpenter <error27@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Wang Qing <wangqing@vivo.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Akhil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc7 next-20220308]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Akhil-P-Oommen/Support-for-GMU-coredump-and-some-related-improvements/20220303-013028
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: riscv-randconfig-r042-20220307 (https://download.01.org/0day-ci/archive/20220308/202203082018.IcI00Nvs-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/23953efc645803299a93f178e9a32f2ae97dae39
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Akhil-P-Oommen/Support-for-GMU-coredump-and-some-related-improvements/20220303-013028
        git checkout 23953efc645803299a93f178e9a32f2ae97dae39
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:967:6: warning: no previous prototype for function 'a6xx_get_gmu_state' [-Wmissing-prototypes]
   void a6xx_get_gmu_state(struct msm_gpu *gpu, struct a6xx_gpu_state *a6xx_state)
        ^
   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:967:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void a6xx_get_gmu_state(struct msm_gpu *gpu, struct a6xx_gpu_state *a6xx_state)
   ^
   static 
   1 warning generated.


vim +/a6xx_get_gmu_state +967 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c

   966	
 > 967	void a6xx_get_gmu_state(struct msm_gpu *gpu, struct a6xx_gpu_state *a6xx_state)
   968	{
   969		struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
   970		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
   971		struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
   972	
   973		if (gmu->hung)
   974			a6xx_gmu_send_nmi(gmu);
   975	
   976		a6xx_get_gmu_registers(gpu, a6xx_state);
   977	}
   978	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
