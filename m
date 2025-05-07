Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92799AAD940
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 09:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D2010E760;
	Wed,  7 May 2025 07:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCiXWS+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB7010E760
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 07:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746604742; x=1778140742;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pc9ZnpfpNAW8KOYgspYmh8RTXqehB+edtu1UuEUhwVw=;
 b=fCiXWS+FphLuH8p/ardWVmN2K3rxql3v/YdeJx+Fq1jA2jEuJVuzwJ5b
 u2koIiC1v/lPvXqohzgK37EI1o3nv0zrPidkHejXl+vAPk5VLSkijocKk
 8VAotCr0rHqFOcpu4Jnzx1/lR5aDNUd9jvOtKGSA4LPnA0Q9fine+k+5w
 n7/TrARTDFxQ3UKxN4MV9x9LN1VauU/FSumOputJ79C62P6oWnZjOQalX
 VQnV7m4x9JyQkvqV9er4jBF2ggU1YwFNnd5aJIXNgulnsg/EmBF6vvk8W
 7zVG4dFn+jQ+7/4Uc1nNobWJn5bnohV35YoirKwoYseeLoFvq+TmxVeqM w==;
X-CSE-ConnectionGUID: TzayU4HXRpqAmRFv3AIkXw==
X-CSE-MsgGUID: SOKbghTdS/uS0DfOOmxKvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51969525"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="51969525"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 00:59:01 -0700
X-CSE-ConnectionGUID: qCHCQ2hDQBu1dMXhuqOWpw==
X-CSE-MsgGUID: HwB8VYUgR8ivGlALf/bRSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="159175157"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 00:58:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uCZg6-0007Mz-26;
 Wed, 07 May 2025 07:58:54 +0000
Date: Wed, 7 May 2025 15:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Apurupa Pattapu <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] tee: add Qualcomm TEE driver
Message-ID: <202505071540.hAeEOUWt-lkp@intel.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb@oss.qualcomm.com>
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

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 33035b665157558254b3c21c3f049fd728e72368]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250429-140908
base:   33035b665157558254b3c21c3f049fd728e72368
patch link:    https://lore.kernel.org/r/20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-8-6a143640a6cb%40oss.qualcomm.com
patch subject: [PATCH v4 08/11] tee: add Qualcomm TEE driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071540.hAeEOUWt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071540.hAeEOUWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071540.hAeEOUWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tee/qcomtee/async.c:101 function parameter 'async_msg' not described in 'async_release'
>> Warning: drivers/tee/qcomtee/async.c:101 Excess function parameter 'msg' description in 'async_release'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=y]
   Selected by [m]:
   - UCSI_HUAWEI_GAOKUN [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_UCSI [=m] && EC_HUAWEI_GAOKUN [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
