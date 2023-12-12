Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB880F5D8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 19:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A84C10E658;
	Tue, 12 Dec 2023 18:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ADA10E658
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 18:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702407291; x=1733943291;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fhtw7jwfZStNBl0doZOH1Goh94LDTrinYbroAI2TZRs=;
 b=V8cnKXUF+K+s97q/he4OKZ9H4jVAUoxxNykBNEFa9+NLxJyoMFT9ok7k
 sWRQ7N9G4ITUWpgLhtoWzALo0AWzsxtlPsYWBMJFUfiRpGlpM5n75/lLV
 tmwPvDwZcQ4kTP7nXX1a5eCZ7avVChCYjqt5JkQAbBxtSUVEHSAGZXxP6
 CjS76HWdqRE1ydpGI9ArmE+g9utHLnEH5+sohBOYNQjRDsjByzF8Rx8Nj
 wTMFKrRmw5HEhzuLOax5eDhj9oxdXcVGuB3P7g08/hZYvp+43O0ZWGqH9
 yVa2Mis1aFcPc5Lok5Gzgo/KLv2Wkp7Y+kU3FxUX/+AvcdH05JoP/mr/D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="385263227"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="385263227"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 10:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749814655"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749814655"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 10:54:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rD7u1-000Ja5-1T;
 Tue, 12 Dec 2023 18:54:45 +0000
Date: Wed, 13 Dec 2023 02:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <202312130235.qG8OwKk0-lkp@intel.com>
References: <20231212143038.3828691-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212143038.3828691-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v6.7-rc5 next-20231212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/ASoC-hdmi-codec-drop-drm-drm_edid-h-include/20231212-223200
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20231212143038.3828691-1-jani.nikula%40intel.com
patch subject: [PATCH] ASoC: hdmi-codec: drop drm/drm_edid.h include
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231213/202312130235.qG8OwKk0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130235.qG8OwKk0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130235.qG8OwKk0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_display.c: In function 'dp_display_process_hpd_high':
>> drivers/gpu/drm/msm/dp/dp_display.c:406:31: error: implicit declaration of function 'drm_detect_monitor_audio' [-Werror=implicit-function-declaration]
     406 |         dp->audio_supported = drm_detect_monitor_audio(edid);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_is_full_range':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:168:17: error: implicit declaration of function 'drm_default_rgb_quant_range' [-Werror=implicit-function-declaration]
     168 |                 drm_default_rgb_quant_range(mode) == HDMI_QUANTIZATION_RANGE_FULL;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_handle_hotplug':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:437:16: error: implicit declaration of function 'drm_get_edid'; did you mean 'drm_gem_evict'? [-Werror=implicit-function-declaration]
     437 |         edid = drm_get_edid(connector, vc4_hdmi->ddc);
         |                ^~~~~~~~~~~~
         |                drm_gem_evict
>> drivers/gpu/drm/vc4/vc4_hdmi.c:437:14: warning: assignment to 'struct edid *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     437 |         edid = drm_get_edid(connector, vc4_hdmi->ddc);
         |              ^
   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_connector_get_modes':
   drivers/gpu/drm/vc4/vc4_hdmi.c:508:14: warning: assignment to 'struct edid *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     508 |         edid = drm_get_edid(connector, vc4_hdmi->ddc);
         |              ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:514:15: error: implicit declaration of function 'drm_add_edid_modes' [-Werror=implicit-function-declaration]
     514 |         ret = drm_add_edid_modes(connector, edid);
         |               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_set_avi_infoframe':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:910:15: error: implicit declaration of function 'drm_hdmi_avi_infoframe_from_display_mode'; did you mean 'drm_hdmi_avi_infoframe_content_type'? [-Werror=implicit-function-declaration]
     910 |         ret = drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               drm_hdmi_avi_infoframe_content_type
>> drivers/gpu/drm/vc4/vc4_hdmi.c:917:9: error: implicit declaration of function 'drm_hdmi_avi_infoframe_quant_range'; did you mean 'drm_hdmi_avi_infoframe_content_type'? [-Werror=implicit-function-declaration]
     917 |         drm_hdmi_avi_infoframe_quant_range(&frame.avi,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         drm_hdmi_avi_infoframe_content_type
   drivers/gpu/drm/vc4/vc4_hdmi.c: In function 'vc4_hdmi_sink_supports_format_bpc':
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1930:18: error: implicit declaration of function 'drm_match_cea_mode' [-Werror=implicit-function-declaration]
    1930 |         u8 vic = drm_match_cea_mode(mode);
         |                  ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1950:70: error: 'DRM_EDID_HDMI_DC_30' undeclared (first use in this function)
    1950 |                 if (bpc == 10 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30)) {
         |                                                                      ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:1950:70: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/vc4/vc4_hdmi.c:1955:70: error: 'DRM_EDID_HDMI_DC_36' undeclared (first use in this function)
    1955 |                 if (bpc == 12 && !(info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36)) {
         |                                                                      ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/drm_detect_monitor_audio +406 drivers/gpu/drm/msm/dp/dp_display.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  381  
c943b4948b5848 Chandan Uddaraju 2020-08-27  382  static int dp_display_process_hpd_high(struct dp_display_private *dp)
c943b4948b5848 Chandan Uddaraju 2020-08-27  383  {
c943b4948b5848 Chandan Uddaraju 2020-08-27  384  	int rc = 0;
c943b4948b5848 Chandan Uddaraju 2020-08-27  385  	struct edid *edid;
c943b4948b5848 Chandan Uddaraju 2020-08-27  386  
c943b4948b5848 Chandan Uddaraju 2020-08-27  387  	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
0e7f270591a42f Kuogee Hsieh     2022-12-27  388  	dp->panel->max_dp_link_rate = dp->parser->max_dp_link_rate;
0e7f270591a42f Kuogee Hsieh     2022-12-27  389  
0e7f270591a42f Kuogee Hsieh     2022-12-27  390  	drm_dbg_dp(dp->drm_dev, "max_lanes=%d max_link_rate=%d\n",
0e7f270591a42f Kuogee Hsieh     2022-12-27  391  		dp->panel->max_dp_lanes, dp->panel->max_dp_link_rate);
c943b4948b5848 Chandan Uddaraju 2020-08-27  392  
c943b4948b5848 Chandan Uddaraju 2020-08-27  393  	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
c943b4948b5848 Chandan Uddaraju 2020-08-27  394  	if (rc)
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  395  		goto end;
c943b4948b5848 Chandan Uddaraju 2020-08-27  396  
c943b4948b5848 Chandan Uddaraju 2020-08-27  397  	dp_link_process_request(dp->link);
c943b4948b5848 Chandan Uddaraju 2020-08-27  398  
bfcc3d8f94f4cb Dmitry Baryshkov 2023-09-04  399  	drm_dp_set_subconnector_property(dp->dp_display.connector, connector_status_connected,
bfcc3d8f94f4cb Dmitry Baryshkov 2023-09-04  400  					 dp->panel->dpcd, dp->panel->downstream_ports);
bfcc3d8f94f4cb Dmitry Baryshkov 2023-09-04  401  
c943b4948b5848 Chandan Uddaraju 2020-08-27  402  	edid = dp->panel->edid;
c943b4948b5848 Chandan Uddaraju 2020-08-27  403  
b78c77273a5648 Abhinav Kumar    2023-04-27  404  	dp->dp_display.psr_supported = dp->panel->psr_cap.version && psr_enabled;
cd779808cccd50 Vinod Polimera   2023-03-02  405  
c943b4948b5848 Chandan Uddaraju 2020-08-27 @406  	dp->audio_supported = drm_detect_monitor_audio(edid);
c943b4948b5848 Chandan Uddaraju 2020-08-27  407  	dp_panel_handle_sink_request(dp->panel);
c943b4948b5848 Chandan Uddaraju 2020-08-27  408  
c943b4948b5848 Chandan Uddaraju 2020-08-27  409  	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  410  
f21c8a276c2dad Kuogee Hsieh     2021-05-21  411  	/*
f21c8a276c2dad Kuogee Hsieh     2021-05-21  412  	 * set sink to normal operation mode -- D0
f21c8a276c2dad Kuogee Hsieh     2021-05-21  413  	 * before dpcd read
f21c8a276c2dad Kuogee Hsieh     2021-05-21  414  	 */
f21c8a276c2dad Kuogee Hsieh     2021-05-21  415  	dp_link_psm_config(dp->link, &dp->panel->link_info, false);
f21c8a276c2dad Kuogee Hsieh     2021-05-21  416  
6625e2637d93d2 Tanmay Shah      2020-09-25  417  	dp_link_reset_phy_params_vx_px(dp->link);
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  418  	rc = dp_ctrl_on_link(dp->ctrl);
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  419  	if (rc) {
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  420  		DRM_ERROR("failed to complete DP link training\n");
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  421  		goto end;
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  422  	}
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  423  
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  424  	dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  425  
c943b4948b5848 Chandan Uddaraju 2020-08-27  426  end:
c943b4948b5848 Chandan Uddaraju 2020-08-27  427  	return rc;
c943b4948b5848 Chandan Uddaraju 2020-08-27  428  }
c943b4948b5848 Chandan Uddaraju 2020-08-27  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
