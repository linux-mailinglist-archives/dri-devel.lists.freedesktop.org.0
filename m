Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3830741ACB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 23:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27DB10E3A5;
	Wed, 28 Jun 2023 21:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83FC10E39D;
 Wed, 28 Jun 2023 21:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687987561; x=1719523561;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M7aa333XpPNGYhk+GT02yvHRVbg6aw/odt14RBTj1RI=;
 b=eVEP3igP/AlR4M0m/pRNdKrPH2bnEoBYV2Ov6sQ6f/8KXz5fMHH54rQy
 2fIzOfyaKPhpid26dq127lz8KC+5hq6hpmEd/fcskyyvS3T9gVf8TR7yj
 mZim+s8rAPXrC6DL14e7iV1DGvG6Mv4DrU49KgxARGputRlENch2HVPJ9
 C+vIqNhExJsMbiOLmFXsJ78fcRsgOzN802j9EsWfuetBRtrVXNQ5SMCV2
 x1xB6DqUTPKvGHOxHcxX6cIafHEPIHznCqD3NfESW9TuuPNNvA3RNIcXC
 /7LuKdYQGzbGrgFJ4bWEsx8dB4cXV3Jbzn26qBcyUnfpPBZWUrPxTxvnh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351756288"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="351756288"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 14:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="861673519"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="861673519"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2023 14:25:54 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qEcfh-000DVB-2t;
 Wed, 28 Jun 2023 21:25:53 +0000
Date: Thu, 29 Jun 2023 05:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: Re: [PATCH 2/4] regulator: Introduce Qualcomm REFGEN regulator driver
Message-ID: <202306290533.nqqGHj1w-lkp@intel.com>
References: <20230628-topic-refgen-v1-2-126e59573eeb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628-topic-refgen-v1-2-126e59573eeb@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5c875096d59010cee4e00da1f9c7bdb07a025dc2]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bindings-regulator-Describe-Qualcomm-REFGEN-regulator/20230629-003148
base:   5c875096d59010cee4e00da1f9c7bdb07a025dc2
patch link:    https://lore.kernel.org/r/20230628-topic-refgen-v1-2-126e59573eeb%40linaro.org
patch subject: [PATCH 2/4] regulator: Introduce Qualcomm REFGEN regulator driver
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230629/202306290533.nqqGHj1w-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306290533.nqqGHj1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306290533.nqqGHj1w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:17,
                    from include/linux/spinlock.h:59,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/regulator/qcom-refgen-regulator.c:7:
   arch/loongarch/include/asm/percpu.h:20:4: error: #error compiler support for the model attribute is necessary when a recent assembler is used
      20 | #  error compiler support for the model attribute is necessary when a recent assembler is used
         |    ^~~~~
   drivers/regulator/qcom-refgen-regulator.c: In function 'qcom_sdm845_refgen_is_enabled':
>> drivers/regulator/qcom-refgen-regulator.c:64:13: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      64 |         if (FIELD_GET(REFGEN_BG_CTRL_MASK, val) != REFGEN_BG_CTRL_ENABLE)
         |             ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +64 drivers/regulator/qcom-refgen-regulator.c

    57	
    58	static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
    59	{
    60		struct qcom_refgen *vreg = rdev_get_drvdata(rdev);
    61		u32 val;
    62	
    63		regmap_read(vreg->base, REFGEN_REG_BG_CTRL, &val);
  > 64		if (FIELD_GET(REFGEN_BG_CTRL_MASK, val) != REFGEN_BG_CTRL_ENABLE)
    65			return 0;
    66	
    67		regmap_read(vreg->base, REFGEN_REG_BIAS_EN, &val);
    68		if (FIELD_GET(REFGEN_BIAS_EN_MASK, val) != REFGEN_BIAS_EN_ENABLE)
    69			return 0;
    70	
    71		return 1;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
