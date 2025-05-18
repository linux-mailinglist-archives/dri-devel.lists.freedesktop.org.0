Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3CABADFB
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 06:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1482210E062;
	Sun, 18 May 2025 04:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HN86NyaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9544F10E1E4;
 Sun, 18 May 2025 04:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747543980; x=1779079980;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tl+/bI4JwREUGkxjpSb0RGZADW8LJu4lETQehDCuUv4=;
 b=HN86NyaTTvf0TAIpXqpnvzlZPKbVnf6SrzDrXvAi6SBvnhu4XciHkZaK
 ZK0sPxgTTc9TsOh503I5IP9njSAQeAlgdZe5juG/dTK1TOLlA4GgUlFFx
 iTicC0knv5u7IjfZDl+LzBDitAbIHPeH7nPfCxnFZtYDdDaCsIDNviAq7
 efuDericKuTcTKZpHcpCCuLJMKnj3L425FJno+OMH8X5QkKwwuH5n+BGt
 ksEgqEaMTfOwDtjCvFAPpIAdcAjrzXnn8w0leN+rw0B+MXWxx9fIlBDtL
 1yzIJ5g1s1pW7uuJcQqgjZvqAajMOhUsPXr2/JErAlepHRUvhr+/388bS g==;
X-CSE-ConnectionGUID: YGOXrNLBQuGjFLNhRE9ZXg==
X-CSE-MsgGUID: J6bQuxN1Qpy41CKc5e4qzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="71970899"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; d="scan'208";a="71970899"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2025 21:52:59 -0700
X-CSE-ConnectionGUID: Ji3GgWruQTawsTWaFD8C7g==
X-CSE-MsgGUID: sWiKOAwCRIq8RtY64V/4nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; d="scan'208";a="140072658"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 17 May 2025 21:52:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uGW16-000Kcp-22;
 Sun, 18 May 2025 04:52:52 +0000
Date: Sun, 18 May 2025 12:52:31 +0800
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
Subject: Re: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <202505181204.fkaJyv3U-lkp@intel.com>
References: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-Add-UBWC-config-provider/20250518-013605
base:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
patch link:    https://lore.kernel.org/r/20250517-topic-ubwc_central-v3-4-3c8465565f86%40oss.qualcomm.com
patch subject: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common UBWC config
config: arm64-randconfig-004-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181204.fkaJyv3U-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181204.fkaJyv3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181204.fkaJyv3U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: qcom_ubwc_config_get_data
   >>> referenced by a6xx_gpu.c
   >>>               drivers/gpu/drm/msm/adreno/a6xx_gpu.o:(a6xx_gpu_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
