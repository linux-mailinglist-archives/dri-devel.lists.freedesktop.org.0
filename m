Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17066785D36
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 18:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CFE10E476;
	Wed, 23 Aug 2023 16:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24A810E475;
 Wed, 23 Aug 2023 16:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692808013; x=1724344013;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p+QCSo7Rvow0+W1Uj7taMmY+Cl5pg16z6fZ0NSSfq38=;
 b=Fa9YjF24EnZ1ZBXVftzHoYN4UKof22h9zWyu90Chf+pv0k3dRFR3GOvG
 T5PMWWviMJlBMXBK9PSOk6f4UBsjQY1FpzNRkDtWzVAlToQnqe7VhUNVc
 B/CUVl4XPIcGUauXmmKST07081BudsM9Ah2+jYZaGiplaEI5gxNsBoRvW
 dkOLrscaKoc83apYvOC3nqIgMpQX0lxsSVCVsdWQzVdvrKCasthXyH0ms
 3KcF62jOoqaSV1gqw9WJo7aPhtbYTKU/+TBwXbnQbPwnEvhk4ZDIGF0nL
 QBI1Fp3VLkhBD+lMfddnIgAU6xa5nFDdN+Oq/jbSHYdTIOrMrJl/6Nls+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="460573151"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="460573151"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 09:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="766203103"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="766203103"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 09:26:50 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qYqgz-0001Lb-2A;
 Wed, 23 Aug 2023 16:26:49 +0000
Date: Thu, 24 Aug 2023 00:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is
 supported
Message-ID: <202308240007.1edS9XsL-lkp@intel.com>
References: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ankit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v6.5-rc7 next-20230823]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-display-dp-Default-8-bpc-support-when-DSC-is-supported/20230823-195946
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230823115425.715644-2-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is supported
config: i386-randconfig-r036-20230823 (https://download.01.org/0day-ci/archive/20230824/202308240007.1edS9XsL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308240007.1edS9XsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308240007.1edS9XsL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_helper.c:2451:6: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
           if (!dsc_dpcd[DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
               ^                         ~
   drivers/gpu/drm/display/drm_dp_helper.c:2451:6: note: add parentheses after the '!' to evaluate the bitwise operator first
           if (!dsc_dpcd[DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
               ^
                (                                                           )
   drivers/gpu/drm/display/drm_dp_helper.c:2451:6: note: add parentheses around left hand side expression to silence this warning
           if (!dsc_dpcd[DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
               ^
               (                        )
   1 warning generated.


vim +2451 drivers/gpu/drm/display/drm_dp_helper.c

  2428	
  2429	/**
  2430	 * drm_dp_dsc_sink_supported_input_bpcs() - Get all the input bits per component
  2431	 * values supported by the DSC sink.
  2432	 * @dsc_dpcd: DSC capabilities from DPCD
  2433	 * @dsc_bpc: An array to be filled by this helper with supported
  2434	 *           input bpcs.
  2435	 *
  2436	 * Read the DSC DPCD from the sink device to parse the supported bits per
  2437	 * component values. This is used to populate the DSC parameters
  2438	 * in the &struct drm_dsc_config by the driver.
  2439	 * Driver creates an infoframe using these parameters to populate
  2440	 * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
  2441	 * infoframe using the helper function drm_dsc_pps_infoframe_pack()
  2442	 *
  2443	 * Returns:
  2444	 * Number of input BPC values parsed from the DPCD
  2445	 */
  2446	int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
  2447						 u8 dsc_bpc[3])
  2448	{
  2449		int num_bpc = 0;
  2450	
> 2451		if (!dsc_dpcd[DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
  2452			return 0;
  2453	
  2454		u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
  2455	
  2456		if (color_depth & DP_DSC_12_BPC)
  2457			dsc_bpc[num_bpc++] = 12;
  2458		if (color_depth & DP_DSC_10_BPC)
  2459			dsc_bpc[num_bpc++] = 10;
  2460	
  2461		/* A DP DSC Sink devices shall support 8 bpc. */
  2462		dsc_bpc[num_bpc++] = 8;
  2463	
  2464		return num_bpc;
  2465	}
  2466	EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
  2467	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
