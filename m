Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0274E5350
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 14:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C6E10E4C8;
	Wed, 23 Mar 2022 13:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C9710E6E8;
 Wed, 23 Mar 2022 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648042773; x=1679578773;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b67L/NnWXK6zdMJnGoBPKI8l38ipkirGLoJ+NGWOHGo=;
 b=Yq2lWeZ/Bky7h20LsUhtWKpIM85jR/s+rXE0GEU7mMUqbwkH3CplKb4x
 RkIXlyXh9kUB0pDDm62mWJTfdbGAZgZQApfRzICAutcfDtX7vYCM7AXPA
 Lp96ePl4H2i9u9wLL+2O+8Lk335vwfIgTR6sEBmePjAjyk+Uwnbjmj0Tb
 CETXwR/id4VGCQxlmg0EUTU/W8dwZO2Spfq1RzxylNb0u/N4btADn7hek
 TkR3Cugx3n5wUEyAUodZqSFaNR5H51BcRxmGfv/VToXZDdRpaotLem1YN
 R/4ISbrkEzDHbY+9GV+6nVejHqQ7p1WWSDg+fHtHRHGWBcGEXjITL4DqM A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="321308790"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="321308790"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 06:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="515780269"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 23 Mar 2022 06:39:30 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nX1D0-000K5o-4u; Wed, 23 Mar 2022 13:39:30 +0000
Date: Wed, 23 Mar 2022 21:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 3/6] drm/msm: split the main platform driver
Message-ID: <202203232120.4EJF1VFq-lkp@intel.com>
References: <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
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
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[cannot apply to v5.17 next-20220323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Baryshkov/drm-msm-rework-MDSS-drivers/20220323-172654
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: nios2-randconfig-p002-20220323 (https://download.01.org/0day-ci/archive/20220323/202203232120.4EJF1VFq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5484d7bfa709bbe2cd2cbb3b9959190d7a025c16
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-rework-MDSS-drivers/20220323-172654
        git checkout 5484d7bfa709bbe2cd2cbb3b9959190d7a025c16
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/acpi.h:15,
                    from include/linux/irqchip.h:14,
                    from drivers/gpu/drm/msm/msm_mdss.c:8:
>> drivers/gpu/drm/msm/msm_mdss.c:403:25: error: 'dt_match' undeclared here (not in a function); did you mean 'dr_match_t'?
     403 | MODULE_DEVICE_TABLE(of, dt_match);
         |                         ^~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__dt_match_device_table' aliased to undefined symbol 'dt_match'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/gpu/drm/msm/msm_mdss.c:403:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     403 | MODULE_DEVICE_TABLE(of, dt_match);
         | ^~~~~~~~~~~~~~~~~~~


vim +403 drivers/gpu/drm/msm/msm_mdss.c

   390	
   391	static const struct of_device_id mdss_dt_match[] = {
   392		{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
   393		{ .compatible = "qcom,msm8998-mdss", .data = (void *)KMS_DPU },
   394		{ .compatible = "qcom,qcm2290-mdss", .data = (void *)KMS_DPU },
   395		{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
   396		{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
   397		{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
   398		{ .compatible = "qcom,sc8180x-mdss", .data = (void *)KMS_DPU },
   399		{ .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
   400		{ .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
   401		{}
   402	};
 > 403	MODULE_DEVICE_TABLE(of, dt_match);
   404	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
