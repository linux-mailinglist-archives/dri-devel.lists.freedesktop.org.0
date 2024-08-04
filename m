Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12A946D91
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2024 10:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0279A89349;
	Sun,  4 Aug 2024 08:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cu2Cu+U5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B667310E0DD;
 Sun,  4 Aug 2024 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722761426; x=1754297426;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yIfG+y6dlsFmwosbOgh/XZH8KdxpvjTvDeRIGXGIVr0=;
 b=Cu2Cu+U5NYNS3to77WEK9NDNi/W0EkSEjl59CXQrQkJhmmTXbzkyBsym
 CRwYX6lAjVKOM1DLGgeW3d5QY95LRWt2wcwH4gLCDxuhV/Q5vQ4C8JuG1
 UPKoq5N9HCB6vwrtRRGXYuPiE089KH3hR3CiISH90OLMUCyzfyTxaXfJE
 /s4SfojvvktRXk8/SQ/3f2xkZr1x7I9IR5BE5RsjJeVV/5PZg25wszuO5
 rkm/tQRUavDpsRVoOet9dUnmek4Fqqa5a9JY6/8MsX1vzs+oDZUZQTemj
 sS+jrs/3XUB4s+0TVnkfVhHnmep26gTMdB7Lt1+oq5XC3ttg+WotzJjQ+ Q==;
X-CSE-ConnectionGUID: ODMwwFDvT3a51frFhKfVfg==
X-CSE-MsgGUID: ZNydYH+HRXSmBw+GKV51jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="24604108"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; d="scan'208";a="24604108"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2024 01:50:25 -0700
X-CSE-ConnectionGUID: UrOICgroRjqQFrEMOkzUQQ==
X-CSE-MsgGUID: HU+uer4aQC2wl/DoapeiOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; d="scan'208";a="55520444"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
 by fmviesa007.fm.intel.com with ESMTP; 04 Aug 2024 01:50:19 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1saWwT-0001KQ-1A;
 Sun, 04 Aug 2024 08:50:17 +0000
Date: Sun, 4 Aug 2024 16:49:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mike Tipton <quic_mdtipton@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 07/11] dt-bindings: interconnect: qcom,sm8450: drop DISP
 nodes
Message-ID: <202408041643.qHy043eG-lkp@intel.com>
References: <20240804-sm8350-fixes-v1-7-1149dd8399fe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804-sm8350-fixes-v1-7-1149dd8399fe@linaro.org>
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

[auto build test ERROR on 668d33c9ff922c4590c58754ab064aaf53c387dd]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk-qcom-dispcc-sm8250-use-CLK_SET_RATE_PARENT-for-branch-clocks/20240804-134328
base:   668d33c9ff922c4590c58754ab064aaf53c387dd
patch link:    https://lore.kernel.org/r/20240804-sm8350-fixes-v1-7-1149dd8399fe%40linaro.org
patch subject: [PATCH 07/11] dt-bindings: interconnect: qcom,sm8450: drop DISP nodes
config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041643.qHy043eG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041643.qHy043eG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408041643.qHy043eG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sm8450.dtsi:3055.31-32 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
