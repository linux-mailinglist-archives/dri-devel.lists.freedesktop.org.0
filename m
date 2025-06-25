Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF12AE931C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 01:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790910E24A;
	Wed, 25 Jun 2025 23:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoFtYRex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A17C10E24A;
 Wed, 25 Jun 2025 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750895871; x=1782431871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CkcCjk8IzsSvEHOxb9mbqVNqkfQ5haY3GvAwzUt4bxI=;
 b=VoFtYRexxdqXFyVILOXiQ6elIxwj/yCQukdkz4ccE3/t9RPtfLB1VeP4
 l2THbI2n3Top8g0kGRwtpHWKcuc8/zOtM/KJYWsravomvQcXNPEL7OwNY
 l9W0/ZvKi41hgPFzXURff7BZ+fjTfRrOqFquzDzRd0l+LfQr15HoxSURX
 OMWOZtF+Efp8OSYwZRkJAmpSZpBS+kbuQYEVw5YtB/QJW5ZVmae/yjq6w
 Kuy3d1blytgzdIDdaNkkIqXT6fezk+MIrhCshZB1UP7o554kx44+5ZZbh
 ii0+hnXulHMW8ixZl1w7TpAvJXBX6F5lXcAdTLbCQ045Ek90Xio9oJ0W+ g==;
X-CSE-ConnectionGUID: 9nGabZ3ORSu/5vkl5vMNJA==
X-CSE-MsgGUID: p11D3qrzTMy4g3AiBS4SMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64616233"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="64616233"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 16:57:49 -0700
X-CSE-ConnectionGUID: Gy7XcTc0Sc2uOSE6wWY0hg==
X-CSE-MsgGUID: RulosnoFTIGOmowOtTQoQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="152884623"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2025 16:57:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uUZzr-000TYQ-0F;
 Wed, 25 Jun 2025 23:57:43 +0000
Date: Thu, 26 Jun 2025 07:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 03/14] drm/msm: Use the central UBWC config database
Message-ID: <202506260718.HOiyc0Mm-lkp@intel.com>
References: <20250625-topic-ubwc_central-v5-3-e256d18219e2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-topic-ubwc_central-v5-3-e256d18219e2@oss.qualcomm.com>
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

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2ae2aaafb21454f4781c30734959cf223ab486ef]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-Add-UBWC-config-provider/20250625-211253
base:   2ae2aaafb21454f4781c30734959cf223ab486ef
patch link:    https://lore.kernel.org/r/20250625-topic-ubwc_central-v5-3-e256d18219e2%40oss.qualcomm.com
patch subject: [PATCH v5 03/14] drm/msm: Use the central UBWC config database
config: arm-randconfig-002-20250626 (https://download.01.org/0day-ci/archive/20250626/202506260718.HOiyc0Mm-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260718.HOiyc0Mm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260718.HOiyc0Mm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/ubwc_config.c:230:34: error: redefinition of 'qcom_ubwc_config_get_data'
     230 | const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
         |                                  ^
   include/linux/soc/qcom/ubwc.h:59:48: note: previous definition is here
      59 | static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
         |                                                ^
   1 error generated.


vim +/qcom_ubwc_config_get_data +230 drivers/soc/qcom/ubwc_config.c

892fee0dfae7022 Konrad Dybcio 2025-06-25  229  
892fee0dfae7022 Konrad Dybcio 2025-06-25 @230  const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
