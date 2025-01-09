Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19182A076C5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21AD10EDC1;
	Thu,  9 Jan 2025 13:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDk6jCJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74C10EDC1;
 Thu,  9 Jan 2025 13:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736428336; x=1767964336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ag+CVL8GO1ZYXa8AfDCwJl1QeL0yUyMSeLoUvIHHepE=;
 b=NDk6jCJsXwmlD8LiNooc3vTMO/zlKnbP43lO9ZkDPpDpEyhOBWVBOhG4
 vzQh54IrzRgExvD9QF/B3RMAJ3tqRzixHueHfEGunhNTCJaLC/VxQCgyl
 hOoxhCEOfWu3JQd1cHHyYpK5rlwAMGIGDH1HWD513l51jSabihJd3dg0E
 uirzB36G8WOdNP1/nOBsa2L9TOM23MARziHDsx30v6Keeb59JONhtAm3v
 a5/qTQ2DVk1D45c2dSOsFXCyC2GTJdKrqzN3U+wIgWHp5HxG7PmkWu2oZ
 fRpCEeBa6hV7849nbNklHrg1twy/KEOQwKuoRil/X7BfVejig7YrWTAlT g==;
X-CSE-ConnectionGUID: 9g4vFjM8T8uSYB1QAlRhAw==
X-CSE-MsgGUID: LFrNw4qCRxOwBIgyiu8NXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36802436"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="36802436"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 05:12:16 -0800
X-CSE-ConnectionGUID: fJrEWseXQLiO5pdH9F86mA==
X-CSE-MsgGUID: fAZbMe0HR5ieD1l6xsc5Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="134235630"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 09 Jan 2025 05:12:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tVsKV-000HZX-2u;
 Thu, 09 Jan 2025 13:12:07 +0000
Date: Thu, 9 Jan 2025 21:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <202501092058.5rRJ1ocm-lkp@intel.com>
References: <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-gpu-acd-v4-5-08a5efaf4a23@quicinc.com>
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

Hi Akhil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dbfac60febfa806abb2d384cb6441e77335d2799]

url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-P-Oommen/drm-msm-adreno-Add-support-for-ACD/20250109-044339
base:   dbfac60febfa806abb2d384cb6441e77335d2799
patch link:    https://lore.kernel.org/r/20250109-gpu-acd-v4-5-08a5efaf4a23%40quicinc.com
patch subject: [PATCH v4 5/7] dt-bindings: opp: Add v2-qcom-adreno vendor bindings
config: csky-randconfig-051-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092058.5rRJ1ocm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092058.5rRJ1ocm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092058.5rRJ1ocm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/opp/opp-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
