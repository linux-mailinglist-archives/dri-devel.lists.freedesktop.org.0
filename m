Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612683F5B4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 15:03:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2042F112391;
	Sun, 28 Jan 2024 14:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DC810E7E7;
 Sun, 28 Jan 2024 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706450615; x=1737986615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y4IeGf5G5kXp/QvjFIs2djdjcL7GIzEtTnjrGf1k2sA=;
 b=g3dxoyyHnODcv1o2Q2EPr5kTzXwOCnDodw31rogLWla5j8bSjdvhvAn0
 2l5YkPv1QLyoeFQNAA8F/UBFeWDE6JuAko5V+bww6zpCict6KvOhvNib8
 wfcSxUMI2uFUd4smlNEwERK4kYBpjh55qtxnouFQB1k17np+FO1NMvdCn
 HaofzgBQiY6+YdulqFV8AZEh54fondlSp2ZX1N+gBffPgLtPQYI4wSujo
 fGQlAv+tVMgHuPt0E/VdV6kT9ccQL9pPyjgDwlVIaJ24+eFqmkXnDXm+n
 MMPfmvmk0tBpKrXU8ZccC5bV5iGN28QHT1gv1IhiLKZVBupcR8nLqNfzE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2604471"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2604471"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2024 06:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="29273410"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 28 Jan 2024 06:03:29 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rU5ks-0003RG-1G;
 Sun, 28 Jan 2024 14:03:26 +0000
Date: Sun, 28 Jan 2024 22:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
Message-ID: <202401282131.j7UUVG6P-lkp@intel.com>
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
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 oe-kbuild-all@lists.linux.dev, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paloma,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.8-rc1]
[also build test ERROR on linus/master next-20240125]
[cannot apply to drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paloma-Arellano/drm-msm-dpu-allow-dpu_encoder_helper_phys_setup_cdm-to-work-for-DP/20240126-034233
base:   v6.8-rc1
patch link:    https://lore.kernel.org/r/20240125193834.7065-11-quic_parellan%40quicinc.com
patch subject: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show major and minor val
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240128/202401282131.j7UUVG6P-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401282131.j7UUVG6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401282131.j7UUVG6P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/dp/dp_catalog.c:547:11: error: implicit declaration of function 'FIELD_GET' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           *major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
                    ^
   drivers/gpu/drm/msm/dp/dp_catalog.c:27:34: note: expanded from macro 'DP_HW_VERSION_MAJOR'
   #define DP_HW_VERSION_MAJOR(reg)        FIELD_GET(GENMASK(31, 28), reg)
                                           ^
   1 error generated.


vim +/FIELD_GET +547 drivers/gpu/drm/msm/dp/dp_catalog.c

   531	
   532	/**
   533	 * dp_catalog_hw_revision() - retrieve DP hw revision
   534	 *
   535	 * @dp_catalog: DP catalog structure
   536	 *
   537	 * Return: void
   538	 *
   539	 */
   540	void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16 *major, u16 *minor)
   541	{
   542		const struct dp_catalog_private *catalog = container_of(dp_catalog,
   543					struct dp_catalog_private, dp_catalog);
   544		u32 reg_dp_hw_version;
   545	
   546		reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
 > 547		*major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
   548		*minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
   549	}
   550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
