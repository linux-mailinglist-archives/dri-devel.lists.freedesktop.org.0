Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780FF76D373
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 18:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76F610E54F;
	Wed,  2 Aug 2023 16:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5D310E54B;
 Wed,  2 Aug 2023 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690992777; x=1722528777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qvgaDHQgSlNzPVOo9qiNYCvex5QhghTrjiaZZVn1+QM=;
 b=i1fRtUTVxKLshZHvELth+veJvmFnJgL1za/hTdhFMtQWksnL5BWVnwi3
 cP3BLgLQ9K4BjxMKs55bPhHDcw0IUVig/fpeVgJKxLeo+eOQF6Sy/DHCi
 iATTLTzdyBYgzYVFDRIEZhw5ognzwOWVL3ools5VP8TN/PdwpPbCEZPyG
 7oz92hqgOWMlt8piy7j5yyGvJWcKWkKfIGbuRvoZxsaQ2pbT7LX/4Cuar
 40svE/o+pPgrzeaecU/GsxHitPkNiFmwSLXxfsH989vvG7JndRLR6Cqeo
 7nn7qNeYPTH+ux88TT/3hJ/d82VOyBHP6vR0do3VRCxdxM9MVERagLEwT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="372360805"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="372360805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 09:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="1059891035"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="1059891035"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2023 09:07:24 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qRENf-0001Jp-1G;
 Wed, 02 Aug 2023 16:07:23 +0000
Date: Thu, 3 Aug 2023 00:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ran Sun <sunran001@208suo.com>, alexander.deucher@amd.com
Subject: Re: [PATCH] drm/amd/display: Clean up errors in dmub_cmd.h
Message-ID: <202308022342.q4miXfgl-lkp@intel.com>
References: <20230802062920.11513-1-sunran001@208suo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802062920.11513-1-sunran001@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ran Sun <sunran001@208suo.com>,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ran,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ran-Sun/drm-amd-display-Clean-up-errors-in-dmub_cmd-h/20230802-142950
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230802062920.11513-1-sunran001%40208suo.com
patch subject: [PATCH] drm/amd/display: Clean up errors in dmub_cmd.h
config: alpha-randconfig-r036-20230801 (https://download.01.org/0day-ci/archive/20230802/202308022342.q4miXfgl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308022342.q4miXfgl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308022342.q4miXfgl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:40,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/link.h:78,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_hpo_dp.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/link/hwss/link_hwss_hpo_dp.c:25:
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h:1079:33: error: flexible array member not at end of struct
    1079 |                         uint8_t padding[];
         |                                 ^~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dmub/src/../dmub_srv.h:67,
                    from drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn301.c:26:
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/../inc/dmub_cmd.h:1079:33: error: flexible array member not at end of struct
    1079 |                         uint8_t padding[];
         |                                 ^~~~~~~


vim +1079 drivers/gpu/drm/amd/amdgpu/../display/dmub/inc/dmub_cmd.h

  1038	
  1039	/* Per pipe struct which stores the MCLK switch mode
  1040	 * data to be sent to DMUB.
  1041	 * Named "v2" for now -- once FPO and SUBVP are fully merged
  1042	 * the type name can be updated
  1043	 */
  1044	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 {
  1045		union {
  1046			struct {
  1047				uint32_t pix_clk_100hz;
  1048				uint16_t main_vblank_start;
  1049				uint16_t main_vblank_end;
  1050				uint16_t mall_region_lines;
  1051				uint16_t prefetch_lines;
  1052				uint16_t prefetch_to_mall_start_lines;
  1053				uint16_t processing_delay_lines;
  1054				uint16_t htotal; // required to calculate line time for multi-display cases
  1055				uint16_t vtotal;
  1056				uint8_t main_pipe_index;
  1057				uint8_t phantom_pipe_index;
  1058				/* Since the microschedule is calculated in terms of OTG lines,
  1059				 * include any scaling factors to make sure when we get accurate
  1060				 * conversion when programming MALL_START_LINE (which is in terms
  1061				 * of HUBP lines). If 4K is being downscaled to 1080p, scale factor
  1062				 * is 1/2 (numerator = 1, denominator = 2).
  1063				 */
  1064				uint8_t scale_factor_numerator;
  1065				uint8_t scale_factor_denominator;
  1066				uint8_t is_drr;
  1067				uint8_t main_split_pipe_index;
  1068				uint8_t phantom_split_pipe_index;
  1069			} subvp_data;
  1070	
  1071			struct {
  1072				uint32_t pix_clk_100hz;
  1073				uint16_t vblank_start;
  1074				uint16_t vblank_end;
  1075				uint16_t vstartup_start;
  1076				uint16_t vtotal;
  1077				uint16_t htotal;
  1078				uint8_t vblank_pipe_index;
> 1079				uint8_t padding[];
  1080				struct {
  1081					uint8_t drr_in_use;
  1082					uint8_t drr_window_size_ms;	// Indicates largest VMIN/VMAX adjustment per frame
  1083					uint16_t min_vtotal_supported;	// Min VTOTAL that supports switching in VBLANK
  1084					uint16_t max_vtotal_supported;	// Max VTOTAL that can support SubVP static scheduling
  1085					uint8_t use_ramping;		// Use ramping or not
  1086					uint8_t drr_vblank_start_margin;
  1087				} drr_info;				// DRR considered as part of SubVP + VBLANK case
  1088			} vblank_data;
  1089		} pipe_config;
  1090	
  1091		/* - subvp_data in the union (pipe_config) takes up 27 bytes.
  1092		 * - Make the "mode" field a uint8_t instead of enum so we only use 1 byte (only
  1093		 *   for the DMCUB command, cast to enum once we populate the DMCUB subvp state).
  1094		 */
  1095		uint8_t mode; // enum mclk_switch_mode
  1096	};
  1097	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
