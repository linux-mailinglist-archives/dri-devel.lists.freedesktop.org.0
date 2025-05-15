Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9004BAB83EC
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 12:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE73710E82C;
	Thu, 15 May 2025 10:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IOggzQSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A43510E82B;
 Thu, 15 May 2025 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747305219; x=1778841219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xCYQ6WOiz9cUOPIBQEVZI/wwHsBuLl5q9YtMNp2XXEw=;
 b=IOggzQSLJZPAU60PEgS72ruuWNm22sqxK7kNSa0QPcTOX/EzQqWvl0hB
 izKaVuMT54emDLZLqtlF5bQbnn4zQbG41pnsOqCkW3ifuu9b/DN6b+Pec
 vQGwJutk44PlWC/CggQMoJVQ06Y36lmtzxaVjp20QTXl21hZZcEwkENwt
 EmQ/ZCkQz5xrHf5y8sK7+K3EddVcyshKWBVzGz0eQQosfRwMwUP0dPcgW
 7fVKtW5uWucFIOFFwCytbHlrhNxbh7tBv2GyAinjiOT0Fr7ahx9onh5sM
 SDkQtcaZgTN4B8yV2lGF8W9lYFLNOY0G7fUDIIxtG2yNfyvAxhRJVO+sI Q==;
X-CSE-ConnectionGUID: lrIkIdefTlyruLfb2K4RGg==
X-CSE-MsgGUID: 5qlwplMMS8eIxA2UPmjTPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48351619"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="48351619"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 03:33:30 -0700
X-CSE-ConnectionGUID: isaNyDEPQLy1etpJfSyzrw==
X-CSE-MsgGUID: qKdApXCJTRCaDS+AROvpwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138733577"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 03:33:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uFVu1-000IHP-13;
 Thu, 15 May 2025 10:33:25 +0000
Date: Thu, 15 May 2025 18:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config database
Message-ID: <202505151822.QNn0FQXs-lkp@intel.com>
References: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
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

[auto build test ERROR on edef457004774e598fc4c1b7d1d4f0bcd9d0bb30]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-Add-UBWC-config-provider/20250514-231354
base:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
patch link:    https://lore.kernel.org/r/20250514-topic-ubwc_central-v2-3-09ecbc0a05ce%40oss.qualcomm.com
patch subject: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config database
config: arm64-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151822.QNn0FQXs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151822.QNn0FQXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151822.QNn0FQXs-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/soc/qcom/ubwc_config.c:41:40: warning: unused variable 'sar2130p_data' [-Wunused-const-variable]
41 | static const struct qcom_ubwc_cfg_data sar2130p_data = {
|                                        ^~~~~~~~~~~~~
1 warning generated.
--
ERROR: modpost: missing MODULE_LICENSE() in drivers/soc/qcom/ubwc_config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/ubwc_config.o
>> ERROR: modpost: "qcom_ubwc_config_get_data" [drivers/gpu/drm/msm/msm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
