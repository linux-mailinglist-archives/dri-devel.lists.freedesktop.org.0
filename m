Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2647A89A0A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B38B10E6FF;
	Tue, 15 Apr 2025 10:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbqEAdwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29510E6FA;
 Tue, 15 Apr 2025 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712915; x=1776248915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UnLDAYhq4FCqVA17Fl+xw5KGB7T338dtEXQgFTGwdwI=;
 b=jbqEAdwcA9ERUW2ByVAF3gGGGgrpG2y0orrdSuC6/fV1PvLaLuj2FQwb
 d8tVMQ0F0vJz1hrMEIN0arbLe0uIc3A2e8VZADUHmXB8rDZt75nHoXcvN
 Zn7CWZgSvy86oZwSo2Xr0sWkHdfF2WwXdapkngkCeynEK4N8nYRPv9hme
 RH/GfGkGLFplpgdA+HVVMLWJcEO5LJ+Fb8P/1Pk2PWeS0aX8ffx/lgKw2
 fGN4mqAJmgZJ8+GAamWcw41nu/uEXqKz+6HBff9XVJnjmKL4nnGpeMLqn
 rKpO5V2XDS7AdbvCvymomeIvQMl3YO9a8q2sZaOtGQEm89r9k4WDsfERN w==;
X-CSE-ConnectionGUID: 6IeR5tsIRiGIKkWJtgqCAA==
X-CSE-MsgGUID: tr2sZig7RaWElyOTXKMTsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="50015943"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="50015943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:28:35 -0700
X-CSE-ConnectionGUID: m4ptm9INSeGmg6VZX+vuqg==
X-CSE-MsgGUID: zs7kdG2BTw2PwunMwxgEdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129935770"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa006.fm.intel.com with ESMTP; 15 Apr 2025 03:28:31 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u4dWn-000FdG-0G;
 Tue, 15 Apr 2025 10:28:29 +0000
Date: Tue, 15 Apr 2025 18:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, Jani Nikula <jani.nikula@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH 07/13] drm/amd/display: simplify
 dm_helpers_parse_edid_caps signature
Message-ID: <202504151833.9WxWkFzM-lkp@intel.com>
References: <20250411201333.151335-8-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411201333.151335-8-mwen@igalia.com>
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

[auto build test WARNING on amd-pstate/linux-next]
[also build test WARNING on amd-pstate/bleeding-edge linus/master v6.15-rc2 next-20250415]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Melissa-Wen/drm-amd-display-make-sure-drm_edid-stored-in-aconnector-doesn-t-leak/20250414-132618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git linux-next
patch link:    https://lore.kernel.org/r/20250411201333.151335-8-mwen%40igalia.com
patch subject: [PATCH 07/13] drm/amd/display: simplify dm_helpers_parse_edid_caps signature
config: powerpc-randconfig-003-20250415 (https://download.01.org/0day-ci/archive/20250415/202504151833.9WxWkFzM-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504151833.9WxWkFzM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504151833.9WxWkFzM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:100: warning: Function parameter or struct member 'sink' not described in 'dm_helpers_parse_edid_caps'
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:100: warning: Excess function parameter 'edid' description in 'dm_helpers_parse_edid_caps'
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:100: warning: Excess function parameter 'edid_caps' description in 'dm_helpers_parse_edid_caps'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=y] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]


vim +100 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c

613a7956deb3b1 Aurabindo Pillai     2023-06-12   87  
027ec1819a19f7 Melissa Wen          2025-04-11   88  #define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   89  /**
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   90   * dm_helpers_parse_edid_caps() - Parse edid caps
4562236b3bc0a2 Harry Wentland       2017-09-12   91   *
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   92   * @link: current detected link
4562236b3bc0a2 Harry Wentland       2017-09-12   93   * @edid:	[in] pointer to edid
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   94   * @edid_caps:	[in] pointer to edid caps
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   95   *
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   96   * Return: void
f0b60e6e9b2ba3 Srinivasan Shanmugam 2023-07-13   97   */
cce130cc696979 Melissa Wen          2025-04-11   98  enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
cce130cc696979 Melissa Wen          2025-04-11   99  					       struct dc_sink *sink)
4562236b3bc0a2 Harry Wentland       2017-09-12 @100  {
3c021931023a30 Claudio Suarez       2021-10-17  101  	struct amdgpu_dm_connector *aconnector = link->priv;
3c021931023a30 Claudio Suarez       2021-10-17  102  	struct drm_connector *connector = &aconnector->base;
41b830476009f5 Aurabindo Pillai     2025-02-24  103  	struct drm_device *dev = connector->dev;
cce130cc696979 Melissa Wen          2025-04-11  104  	struct edid *edid_buf;
66c33284fbf286 Melissa Wen          2025-04-11  105  	const struct drm_edid *drm_edid;
23abb3407f98d7 Melissa Wen          2025-04-11  106  	struct drm_edid_product_id product_id;
cce130cc696979 Melissa Wen          2025-04-11  107  	struct dc_edid_caps *edid_caps = &sink->edid_caps;
8e9dfe0e0f1915 Melissa Wen          2025-04-11  108  	int sad_count;
4562236b3bc0a2 Harry Wentland       2017-09-12  109  	int i = 0;
4562236b3bc0a2 Harry Wentland       2017-09-12  110  	enum dc_edid_status result = EDID_OK;
4562236b3bc0a2 Harry Wentland       2017-09-12  111  
cce130cc696979 Melissa Wen          2025-04-11  112  	edid_buf = (struct edid *) &sink->dc_edid.raw_edid;
cce130cc696979 Melissa Wen          2025-04-11  113  	if (!edid_caps || !edid_buf)
4562236b3bc0a2 Harry Wentland       2017-09-12  114  		return EDID_BAD_INPUT;
4562236b3bc0a2 Harry Wentland       2017-09-12  115  
66c33284fbf286 Melissa Wen          2025-04-11  116  	drm_edid = drm_edid_alloc(edid_buf, EDID_LENGTH * (edid_buf->extensions + 1));
66c33284fbf286 Melissa Wen          2025-04-11  117  
66c33284fbf286 Melissa Wen          2025-04-11  118  	if (!drm_edid_valid(drm_edid))
4562236b3bc0a2 Harry Wentland       2017-09-12  119  		result = EDID_BAD_CHECKSUM;
4562236b3bc0a2 Harry Wentland       2017-09-12  120  
66c33284fbf286 Melissa Wen          2025-04-11  121  	drm_edid_connector_update(connector, drm_edid);
23abb3407f98d7 Melissa Wen          2025-04-11  122  	drm_edid_get_product_id(drm_edid, &product_id);
23abb3407f98d7 Melissa Wen          2025-04-11  123  
23abb3407f98d7 Melissa Wen          2025-04-11  124  	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
23abb3407f98d7 Melissa Wen          2025-04-11  125  	edid_caps->product_id = le16_to_cpu(product_id.product_code);
23abb3407f98d7 Melissa Wen          2025-04-11  126  	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
23abb3407f98d7 Melissa Wen          2025-04-11  127  	edid_caps->manufacture_week = product_id.week_of_manufacture;
23abb3407f98d7 Melissa Wen          2025-04-11  128  	edid_caps->manufacture_year = product_id.year_of_manufacture;
4562236b3bc0a2 Harry Wentland       2017-09-12  129  
027ec1819a19f7 Melissa Wen          2025-04-11  130  	memset(edid_caps->display_name, 0, AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
027ec1819a19f7 Melissa Wen          2025-04-11  131  	memcpy(edid_caps->display_name,
027ec1819a19f7 Melissa Wen          2025-04-11  132  	       &connector->eld[DRM_ELD_MONITOR_NAME_STRING],
027ec1819a19f7 Melissa Wen          2025-04-11  133  	       AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS);
4562236b3bc0a2 Harry Wentland       2017-09-12  134  
3c021931023a30 Claudio Suarez       2021-10-17  135  	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
4562236b3bc0a2 Harry Wentland       2017-09-12  136  
24baf0ebdb9d17 Melissa Wen          2025-04-11  137  	apply_edid_quirks(dev, drm_edid, edid_caps);
b7cdccc6a84956 Ryan Lin             2024-02-28  138  
66c33284fbf286 Melissa Wen          2025-04-11  139  	sad_count = drm_eld_sad_count(connector->eld);
66c33284fbf286 Melissa Wen          2025-04-11  140  	if (sad_count <= 0) {
66c33284fbf286 Melissa Wen          2025-04-11  141  		drm_edid_free(drm_edid);
4562236b3bc0a2 Harry Wentland       2017-09-12  142  		return result;
66c33284fbf286 Melissa Wen          2025-04-11  143  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  144  
1347b15d5e8e16 Srinivasan Shanmugam 2023-08-13  145  	edid_caps->audio_mode_count = min(sad_count, DC_MAX_AUDIO_DESC_COUNT);
4562236b3bc0a2 Harry Wentland       2017-09-12  146  	for (i = 0; i < edid_caps->audio_mode_count; ++i) {
66c33284fbf286 Melissa Wen          2025-04-11  147  		struct cea_sad sad;
66c33284fbf286 Melissa Wen          2025-04-11  148  
66c33284fbf286 Melissa Wen          2025-04-11  149  		if (drm_eld_sad_get(connector->eld, i, &sad) < 0)
66c33284fbf286 Melissa Wen          2025-04-11  150  			continue;
4562236b3bc0a2 Harry Wentland       2017-09-12  151  
66c33284fbf286 Melissa Wen          2025-04-11  152  		edid_caps->audio_modes[i].format_code = sad.format;
66c33284fbf286 Melissa Wen          2025-04-11  153  		edid_caps->audio_modes[i].channel_count = sad.channels + 1;
66c33284fbf286 Melissa Wen          2025-04-11  154  		edid_caps->audio_modes[i].sample_rate = sad.freq;
66c33284fbf286 Melissa Wen          2025-04-11  155  		edid_caps->audio_modes[i].sample_size = sad.byte2;
4562236b3bc0a2 Harry Wentland       2017-09-12  156  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  157  
8e9dfe0e0f1915 Melissa Wen          2025-04-11  158  	if (connector->eld[DRM_ELD_SPEAKER])
8e9dfe0e0f1915 Melissa Wen          2025-04-11  159  		edid_caps->speaker_flags = connector->eld[DRM_ELD_SPEAKER];
4562236b3bc0a2 Harry Wentland       2017-09-12  160  	else
4562236b3bc0a2 Harry Wentland       2017-09-12  161  		edid_caps->speaker_flags = DEFAULT_SPEAKER_LOCATION;
4562236b3bc0a2 Harry Wentland       2017-09-12  162  
66c33284fbf286 Melissa Wen          2025-04-11  163  	drm_edid_free(drm_edid);
4562236b3bc0a2 Harry Wentland       2017-09-12  164  
4562236b3bc0a2 Harry Wentland       2017-09-12  165  	return result;
4562236b3bc0a2 Harry Wentland       2017-09-12  166  }
4562236b3bc0a2 Harry Wentland       2017-09-12  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
