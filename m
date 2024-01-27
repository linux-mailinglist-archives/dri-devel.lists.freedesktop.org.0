Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01AA83F24B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 00:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2BB10E42E;
	Sat, 27 Jan 2024 23:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F16C10E42E;
 Sat, 27 Jan 2024 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706399051; x=1737935051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U1AxWClhKSzifIbdDnbsW9clzyYeqHy+cMhLWIr7qKc=;
 b=jAtQOqVx8I9m92teIaMwhJgHXtFvO/lLPazzHjplQMlRdg66nnPfVYhG
 Y5u9LaFRrtKbVoB1R4T7rH8TwJ0Tj2GTXCTK3kylM1ND/ZcaNbhTmIZ3m
 diAN6bjtfrL2m3oQzgVD46YSvTJl95/kn5dy1AOTFISTGB2+Xek98wxUZ
 LV728h48ynOUNi0mugoQ4v2drO3JSbMVsigKt0QYFraWMx8W0aK9wrQ3q
 pmpAhTxezdbN/4Ep5mmyQp/IEwKA03FDDSiBVlxY1HPTaJcP+z65PsIL6
 EbYeoD7ILrY5KFTJd5QgJgaXAwarO1YLX/uHGW/qmG4IRwgtGaY8KYQW7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9376883"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9376883"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 15:44:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="737023180"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="737023180"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 27 Jan 2024 15:44:06 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rTsLD-0002s2-39;
 Sat, 27 Jan 2024 23:44:03 +0000
Date: Sun, 28 Jan 2024 07:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
Message-ID: <202401280752.AmrDI7Ox-lkp@intel.com>
References: <20240125193834.7065-11-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125193834.7065-11-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, Paloma Arellano <quic_parellan@quicinc.com>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, oe-kbuild-all@lists.linux.dev,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paloma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.8-rc1]
[also build test WARNING on linus/master next-20240125]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paloma-Arellano/drm-msm-dpu-allow-dpu_encoder_helper_phys_setup_cdm-to-work-for-DP/20240126-034233
base:   v6.8-rc1
patch link:    https://lore.kernel.org/r/20240125193834.7065-11-quic_parellan%40quicinc.com
patch subject: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show major and minor val
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240128/202401280752.AmrDI7Ox-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280752.AmrDI7Ox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280752.AmrDI7Ox-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_catalog.c:541: warning: Function parameter or struct member 'major' not described in 'dp_catalog_hw_revision'
>> drivers/gpu/drm/msm/dp/dp_catalog.c:541: warning: Function parameter or struct member 'minor' not described in 'dp_catalog_hw_revision'


vim +541 drivers/gpu/drm/msm/dp/dp_catalog.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  531  
757a2f36ab095f Kuogee Hsieh     2022-02-25  532  /**
757a2f36ab095f Kuogee Hsieh     2022-02-25  533   * dp_catalog_hw_revision() - retrieve DP hw revision
757a2f36ab095f Kuogee Hsieh     2022-02-25  534   *
757a2f36ab095f Kuogee Hsieh     2022-02-25  535   * @dp_catalog: DP catalog structure
757a2f36ab095f Kuogee Hsieh     2022-02-25  536   *
5febc52d5716d6 Paloma Arellano  2024-01-25  537   * Return: void
757a2f36ab095f Kuogee Hsieh     2022-02-25  538   *
757a2f36ab095f Kuogee Hsieh     2022-02-25  539   */
5febc52d5716d6 Paloma Arellano  2024-01-25  540  void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor)
757a2f36ab095f Kuogee Hsieh     2022-02-25 @541  {
757a2f36ab095f Kuogee Hsieh     2022-02-25  542  	const struct dp_catalog_private *catalog = container_of(dp_catalog,
757a2f36ab095f Kuogee Hsieh     2022-02-25  543  				struct dp_catalog_private, dp_catalog);
5febc52d5716d6 Paloma Arellano  2024-01-25  544  	u32 reg_dp_hw_version;
757a2f36ab095f Kuogee Hsieh     2022-02-25  545  
5febc52d5716d6 Paloma Arellano  2024-01-25  546  	reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
5febc52d5716d6 Paloma Arellano  2024-01-25  547  	*major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
5febc52d5716d6 Paloma Arellano  2024-01-25  548  	*minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
757a2f36ab095f Kuogee Hsieh     2022-02-25  549  }
757a2f36ab095f Kuogee Hsieh     2022-02-25  550  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
