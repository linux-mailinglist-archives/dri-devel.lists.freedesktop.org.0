Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BBF54382F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 17:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CA7112630;
	Wed,  8 Jun 2022 15:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CAA11259D;
 Wed,  8 Jun 2022 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654703863; x=1686239863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hQWh/ajhlNrdHVnR8asoXOOhohzEj4Vrv4I0sYKIHMk=;
 b=Hf2yPBd1EukiMalQN77+ApBRqBxtLEJR4PppT0NpNdLBw4A2BnefC138
 slwfrTr1UFUgdmx/RpJ63d3Q3HdRoUtCn7+bjEdp5tcYe1o+Y9vGGLrA8
 3nFEuQycQwIfMKgsbxrLFVJ7wWLKk/pv356BldI77fn6O0ENpTg7MNa2Y
 q3ywPfLd2snPxP8ooHys6D7+GkVP4X5ln0XAKZ1nzXnS+pswrH0HnvQ8C
 xTwjlnDe8nqngSZQs4K0rY/adTBC6CuHqgyAHl1Mr9HBL7sOXIrY6/9Jr
 pQAApVCyGH+A/B3gZo0rj/llx6iaUwLChAiXnXZLfTP6U995xysb4Qt7g A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="276972308"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="276972308"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 08:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="609717426"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 08 Jun 2022 08:57:38 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nyy3u-000ElX-2h;
 Wed, 08 Jun 2022 15:57:38 +0000
Date: Wed, 8 Jun 2022 23:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 06/12] drm/msm/hdmi: drop unused GPIO support
Message-ID: <202206082312.XB745jWy-lkp@intel.com>
References: <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on robh/for-next linus/master v5.19-rc1 next-20220608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-hdmi-YAML-ify-schema-and-cleanup-some-platform-properties/20220608-200925
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r045-20220608 (https://download.01.org/0day-ci/archive/20220608/202206082312.XB745jWy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c3e263fe0a077b382c2a76911c8ace385bd59a4c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-hdmi-YAML-ify-schema-and-cleanup-some-platform-properties/20220608-200925
        git checkout c3e263fe0a077b382c2a76911c8ace385bd59a4c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/hdmi/hdmi.c:532:2: warning: variable 'hdmi' is uninitialized when used here [-Wuninitialized]
           hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
           ^~~~
   drivers/gpu/drm/msm/hdmi/hdmi.c:518:19: note: initialize the variable 'hdmi' to silence this warning
           struct hdmi *hdmi;
                            ^
                             = NULL
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
   Depends on HAS_IOMEM && DRM && OF
   Selected by
   - DRM_MSM && HAS_IOMEM && DRM && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST && COMMON_CLK && IOMMU_SUPPORT && (QCOM_OCMEM || QCOM_OCMEM && (QCOM_LLCC || QCOM_LLCC && (QCOM_COMMAND_DB || QCOM_COMMAND_DB


vim +/hdmi +532 drivers/gpu/drm/msm/hdmi/hdmi.c

   513	
   514	static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
   515	{
   516		struct msm_drm_private *priv = dev_get_drvdata(master);
   517		struct hdmi_platform_config *hdmi_cfg;
   518		struct hdmi *hdmi;
   519		struct device_node *of_node = dev->of_node;
   520		int err;
   521	
   522		hdmi_cfg = (struct hdmi_platform_config *)
   523				of_device_get_match_data(dev);
   524		if (!hdmi_cfg) {
   525			DRM_DEV_ERROR(dev, "unknown hdmi_cfg: %pOFn\n", of_node);
   526			return -ENXIO;
   527		}
   528	
   529		hdmi_cfg->mmio_name     = "core_physical";
   530		hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
   531	
 > 532		hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
   533		/* This will catch e.g. -PROBE_DEFER */
   534		if (IS_ERR(hdmi->hpd_gpiod))
   535			return PTR_ERR(hdmi->hpd_gpiod);
   536	
   537		if (!hdmi->hpd_gpiod)
   538			DBG("failed to get HPD gpio");
   539	
   540		if (hdmi->hpd_gpiod)
   541			gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
   542	
   543		dev->platform_data = hdmi_cfg;
   544	
   545		hdmi = msm_hdmi_init(to_platform_device(dev));
   546		if (IS_ERR(hdmi))
   547			return PTR_ERR(hdmi);
   548		priv->hdmi = hdmi;
   549	
   550		err = msm_hdmi_register_audio_driver(hdmi, dev);
   551		if (err) {
   552			DRM_ERROR("Failed to attach an audio codec %d\n", err);
   553			hdmi->audio_pdev = NULL;
   554		}
   555	
   556		return 0;
   557	}
   558	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
