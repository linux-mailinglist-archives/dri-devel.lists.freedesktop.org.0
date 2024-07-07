Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019F929664
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2024 04:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3E110E065;
	Sun,  7 Jul 2024 02:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jl3RToEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997D510E038;
 Sun,  7 Jul 2024 02:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720319135; x=1751855135;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rKND/DDor3jBEfbUtMGSK9KCKF/ysHxNWp/E/B3E1h8=;
 b=jl3RToEn3roFTyAEbSUcbjLRSRWITcVSRM1+MWxrZoDd7C3sA5Pfa+Vv
 B3QkdIhmMKeIrI/sR564GkqFW/GQv9xFUyqFQbiYagcFx1Hqf3nFXdwQp
 2Eq8KBsWS0SAUJMozM+27Jq7e2ENyRaLwRonSovvJD37JQGH+WN2p1hu8
 VF9ZKe+cI8uyVQ6+wS4uqOyynSyZ1XzN6A8BA6bTFSZclFBvOUNW45I59
 WwnNXJnUOxWnrXlaBIKuO3tPD8Z50d2BLya/4WR3qf6lZ5gx/03SlR8Hy
 jAEfPxWbWm0UC12jmM+9Q0gO1V/Gw7kgzTQq+gaEcmpPipS/Y7TinyYC/ Q==;
X-CSE-ConnectionGUID: i9yVmhevRcyDcKjwHpawmQ==
X-CSE-MsgGUID: /Mk7uUisS7CtPGngoiqi1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="21321760"
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; d="scan'208";a="21321760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2024 19:25:34 -0700
X-CSE-ConnectionGUID: EDZ/wsrnSnG6EXixXe+oDw==
X-CSE-MsgGUID: vuSaGMqtTVascBuhV8XStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,189,1716274800"; d="scan'208";a="70374633"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 06 Jul 2024 19:25:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sQHah-000UWQ-31;
 Sun, 07 Jul 2024 02:25:27 +0000
Date: Sun, 7 Jul 2024 10:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v4 11/11] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
Message-ID: <202407071047.0LkXU4JN-lkp@intel.com>
References: <20240706034004.801329-12-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706034004.801329-12-mwen@igalia.com>
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

Hi Melissa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240703]
[cannot apply to amd-pstate/linux-next amd-pstate/bleeding-edge linus/master v6.10-rc6 v6.10-rc5 v6.10-rc4 v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-clean-unused-variables-for-hdmi-freesync-parser/20240706-121621
base:   next-20240703
patch link:    https://lore.kernel.org/r/20240706034004.801329-12-mwen%40igalia.com
patch subject: [PATCH v4 11/11] drm/amd/display: remove dc_edid handler from dm_helpers_parse_edid_caps
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240707/202407071047.0LkXU4JN-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407071047.0LkXU4JN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407071047.0LkXU4JN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:92: warning: Excess function parameter 'edid' description in 'dm_helpers_parse_edid_caps'


vim +92 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c

613a7956deb3b1 Aurabindo Pillai     2023-06-12   79  
4855fdb5fc5488 Melissa Wen          2024-07-06   80  #define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   81  /**
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   82   * dm_helpers_parse_edid_caps() - Parse edid caps
4562236b3bc0a2 Harry Wentland       2017-09-12   83   *
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   84   * @link: current detected link
4562236b3bc0a2 Harry Wentland       2017-09-12   85   * @edid:	[in] pointer to edid
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   86   * @edid_caps:	[in] pointer to edid caps
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   87   *
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   88   * Return: void
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   89   */
4dbd1b96ef4bca Melissa Wen          2024-07-06   90  enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
4562236b3bc0a2 Harry Wentland       2017-09-12   91  					       struct dc_edid_caps *edid_caps)
4562236b3bc0a2 Harry Wentland       2017-09-12  @92  {
3c021931023a30 Claudio Suarez       2021-10-17   93  	struct amdgpu_dm_connector *aconnector = link->priv;
3c021931023a30 Claudio Suarez       2021-10-17   94  	struct drm_connector *connector = &aconnector->base;
766cded62d4ba6 Melissa Wen          2024-07-06   95  	const struct drm_edid *drm_edid = aconnector->drm_edid;
766cded62d4ba6 Melissa Wen          2024-07-06   96  	struct drm_edid_product_id product_id;
c3e817e49503e3 Melissa Wen          2024-07-06   97  	int sad_count;
4562236b3bc0a2 Harry Wentland       2017-09-12   98  	int i = 0;
4562236b3bc0a2 Harry Wentland       2017-09-12   99  	enum dc_edid_status result = EDID_OK;
4562236b3bc0a2 Harry Wentland       2017-09-12  100  
4dbd1b96ef4bca Melissa Wen          2024-07-06  101  	if (!edid_caps || !drm_edid)
4562236b3bc0a2 Harry Wentland       2017-09-12  102  		return EDID_BAD_INPUT;
4562236b3bc0a2 Harry Wentland       2017-09-12  103  
766cded62d4ba6 Melissa Wen          2024-07-06  104  	drm_edid_get_product_id(drm_edid, &product_id);
766cded62d4ba6 Melissa Wen          2024-07-06  105  
766cded62d4ba6 Melissa Wen          2024-07-06  106  	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
766cded62d4ba6 Melissa Wen          2024-07-06  107  	edid_caps->product_id = le16_to_cpu(product_id.product_code);
766cded62d4ba6 Melissa Wen          2024-07-06  108  	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
766cded62d4ba6 Melissa Wen          2024-07-06  109  	edid_caps->manufacture_week = product_id.week_of_manufacture;
766cded62d4ba6 Melissa Wen          2024-07-06  110  	edid_caps->manufacture_year = product_id.year_of_manufacture;
4562236b3bc0a2 Harry Wentland       2017-09-12  111  
4855fdb5fc5488 Melissa Wen          2024-07-06  112  	memset(edid_caps->display_name, 0, AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
4855fdb5fc5488 Melissa Wen          2024-07-06  113  	memcpy(edid_caps->display_name,
4855fdb5fc5488 Melissa Wen          2024-07-06  114  	       &connector->eld[DRM_ELD_MONITOR_NAME_STRING],
4855fdb5fc5488 Melissa Wen          2024-07-06  115  	       AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS);
4562236b3bc0a2 Harry Wentland       2017-09-12  116  
3c021931023a30 Claudio Suarez       2021-10-17  117  	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
4562236b3bc0a2 Harry Wentland       2017-09-12  118  
766cded62d4ba6 Melissa Wen          2024-07-06  119  	apply_edid_quirks(&product_id, edid_caps);
b7cdccc6a84956 Ryan Lin             2024-02-28  120  
b13a74b7280b1a Melissa Wen          2024-07-06  121  	sad_count = drm_eld_sad_count(connector->eld);
ae2a3495973ef0 Jean Delvare         2019-09-04  122  	if (sad_count <= 0)
4562236b3bc0a2 Harry Wentland       2017-09-12  123  		return result;
4562236b3bc0a2 Harry Wentland       2017-09-12  124  
1347b15d5e8e16 Srinivasan Shanmugam 2023-08-13  125  	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
4562236b3bc0a2 Harry Wentland       2017-09-12  126  	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
b13a74b7280b1a Melissa Wen          2024-07-06  127  		struct cea_sad sad;
4562236b3bc0a2 Harry Wentland       2017-09-12  128  
b13a74b7280b1a Melissa Wen          2024-07-06  129  		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
b13a74b7280b1a Melissa Wen          2024-07-06  130  			continue;
b13a74b7280b1a Melissa Wen          2024-07-06  131  
b13a74b7280b1a Melissa Wen          2024-07-06  132  		edid_caps->audio_modes[i].format_code = sad.format;
b13a74b7280b1a Melissa Wen          2024-07-06  133  		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
b13a74b7280b1a Melissa Wen          2024-07-06  134  		edid_caps->audio_modes[i].sample_rate = sad.freq;
b13a74b7280b1a Melissa Wen          2024-07-06  135  		edid_caps->audio_modes[i].sample_size = sad.byte2;
4562236b3bc0a2 Harry Wentland       2017-09-12  136  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  137  
4562236b3bc0a2 Harry Wentland       2017-09-12  138  
c3e817e49503e3 Melissa Wen          2024-07-06  139  	if (connector->eld[DRM_ELD_SPEAKER])
c3e817e49503e3 Melissa Wen          2024-07-06  140  		edid_caps->speaker_flags = connector->eld[DRM_ELD_SPEAKER];
4562236b3bc0a2 Harry Wentland       2017-09-12  141  	else
4562236b3bc0a2 Harry Wentland       2017-09-12  142  		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
4562236b3bc0a2 Harry Wentland       2017-09-12  143  
4562236b3bc0a2 Harry Wentland       2017-09-12  144  	return result;
4562236b3bc0a2 Harry Wentland       2017-09-12  145  }
4562236b3bc0a2 Harry Wentland       2017-09-12  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
