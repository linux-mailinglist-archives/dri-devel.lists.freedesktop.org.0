Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B538EA5806C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 04:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C3110E0D4;
	Sun,  9 Mar 2025 03:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcfjW5Ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5F610E0D4;
 Sun,  9 Mar 2025 03:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741489303; x=1773025303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IVS3L5J251tbHNugEZ3AM4WfhMC0Zjdnd3Dl1hMO1o4=;
 b=VcfjW5UdOe6VfIlD5jNlUBIJBTojH8kBTRRYRTFdjLZeIi2wSox8Vylm
 N/uWhid5iMLHHJ5CnVUITKAXN6o3bHHZ3JCBFtmv0+NC7jiMyqM0YY9QB
 y4pwWDj68DbcxtbFO9Z6FzAb30nfOJY9rO7GE6lzwJDV0DPVxZl9j6+MJ
 7sfUBeBiybWK6CFQgDNhAMjpH/+cio0OUTuiHSegZxtoG7TAM43fBo7+K
 CkN/dcMaLjEALbPpX2r+kRxZ4K9f0IxAHor4xJoKmECn4d5xvPEVmJu9J
 dnDD/L/0P8mhwsr8+PqMQgCDB+lT1CQY5M0slc9y7xwsKseHjRMAEFZI2 g==;
X-CSE-ConnectionGUID: ITjElfpiR2qKfG4DfHxE3A==
X-CSE-MsgGUID: DdUCv7UpT0uRhnNOWl+7IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46422271"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; d="scan'208";a="46422271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 19:01:34 -0800
X-CSE-ConnectionGUID: 7SGGoZ+fS2+Az4L8zuyXfw==
X-CSE-MsgGUID: fcPirFXBQJGdbTUBxsPpng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; d="scan'208";a="119408689"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa009.jf.intel.com with ESMTP; 08 Mar 2025 19:01:28 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tr6ur-0002b0-1Z;
 Sun, 09 Mar 2025 03:01:25 +0000
Date: Sun, 9 Mar 2025 11:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
Message-ID: <202503091011.Kwbj8DQz-lkp@intel.com>
References: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0a2f889128969dab41861b6e40111aa03dc57014]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/dt-bindings-display-msm-dp-controller-describe-SAR2130P/20250308-094544
base:   0a2f889128969dab41861b6e40111aa03dc57014
patch link:    https://lore.kernel.org/r/20250308-sar2130p-display-v1-6-1d4c30f43822%40linaro.org
patch subject: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
config: arm64-randconfig-001-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091011.Kwbj8DQz-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091011.Kwbj8DQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091011.Kwbj8DQz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_mdss.c:599:3: error: field designator 'ubwc_static' does not refer to any field in type 'const struct msm_mdss_data'
           .ubwc_static = 1,
            ^
   1 error generated.


vim +599 drivers/gpu/drm/msm/msm_mdss.c

   594	
   595	static const struct msm_mdss_data sar2130p_data = {
   596		.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
   597		.ubwc_dec_version = UBWC_4_3,
   598		.ubwc_swizzle = 6,
 > 599		.ubwc_static = 1,
   600		.highest_bank_bit = 0,
   601		.macrotile_mode = 1,
   602		.reg_bus_bw = 74000,
   603	};
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
