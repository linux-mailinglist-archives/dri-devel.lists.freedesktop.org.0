Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4DA58071
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 04:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784B310E1A8;
	Sun,  9 Mar 2025 03:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEgXUH/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6537A10E19B;
 Sun,  9 Mar 2025 03:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741489969; x=1773025969;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DHi9MJPnGZGRDihEky9eZ9K5pTtJu5JwGfbsXs63aYM=;
 b=XEgXUH/CaHJfamfrqqWcAkwW0EPPqnITK/sy35b+6/95VC2+QfMqzzJe
 e3WKXGYdjuB+YSD3qBoeM9Bcr3Z++vhuxBG55X3UzzuJSpIJ46uVVjKf0
 JO+6gZaMXma3dAqwDj3dr4WHYuO5qFAMW7O0XYMjHOFTtg6j+6r7uOn5S
 N+xKJf790Gz3o3srn2Udix5tlXJ4NBMoa3s0Ntg17S4JneG4x9NXLmeC7
 zj3x6wXjGBjAdQP2qdqFJqvFK96DeuK+HOAtKZJtBRKzM8yAM5jdKFuTR
 dTXmKai3ZnqYKmAPVPodHvvM1E5Bc25g6TOINUJNgF3soy3PbjYg5mFtr A==;
X-CSE-ConnectionGUID: S1zPL2IVTDGDYr9BjCD47A==
X-CSE-MsgGUID: 1FCuDAqoRRShs56io7QQ4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46422508"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; d="scan'208";a="46422508"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2025 19:12:47 -0800
X-CSE-ConnectionGUID: DqzgJJ8mTwWR1tSSMsjUwA==
X-CSE-MsgGUID: YMO4U9C0R/6Uf0PY2hDqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; d="scan'208";a="119656338"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
 by orviesa006.jf.intel.com with ESMTP; 08 Mar 2025 19:12:41 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tr75i-0002bY-13;
 Sun, 09 Mar 2025 03:12:38 +0000
Date: Sun, 9 Mar 2025 11:12:14 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
Message-ID: <202503091045.4UVScL8t-lkp@intel.com>
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
config: arm-randconfig-004-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091045.4UVScL8t-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091045.4UVScL8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091045.4UVScL8t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_mdss.c:599:10: error: 'const struct msm_mdss_data' has no member named 'ubwc_static'
     599 |         .ubwc_static = 1,
         |          ^~~~~~~~~~~
   drivers/gpu/drm/msm/msm_mdss.c:600:29: warning: initialized field overwritten [-Woverride-init]
     600 |         .highest_bank_bit = 0,
         |                             ^
   drivers/gpu/drm/msm/msm_mdss.c:600:29: note: (near initialization for 'sar2130p_data.highest_bank_bit')


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
