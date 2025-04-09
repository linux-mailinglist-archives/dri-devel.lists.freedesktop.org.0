Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7228EA81C0D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 07:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DE310E111;
	Wed,  9 Apr 2025 05:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tz0oNzNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1748010E111;
 Wed,  9 Apr 2025 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744176055; x=1775712055;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qEER/RgVCOioJPbMmsKJ72fps24z+FpHP98LKMZRgy8=;
 b=Tz0oNzNhrbSsbpX9baFOciG05kkYmROvnzZGZygIOLrOBV6Xk5AnNnGp
 BOfixlSSgSs77rAjanB3uHe6VTgZiME4uD/Nfkxla63RA/LD9C7Sjcptj
 XXE5G38E2SQVjFBoRf/HWsDCfz+kIoZ5xBVkZi9NxOwgRKpl0Of20qoHF
 ThAkKqNAuvIaeDUD+/pDS6ry1pIF8zmfRZdg/8fAwUK8uREPVAUyJmTOs
 KFdtug1bcyVgI2OKxYPPYJb1kVAIe9ZrdPW4AHrqV7foBU0JRDuEsO+5k
 p8e2Ay3EgkWTUH05lqM6xLjjMXqeAkxTvv+qR9xaHF30aQOCm5yKbJhRQ Q==;
X-CSE-ConnectionGUID: JbHaQKgoQ06MPED5X86iOQ==
X-CSE-MsgGUID: z881i1RbQWyJ4CZQCtbNVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45348891"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="45348891"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 22:20:54 -0700
X-CSE-ConnectionGUID: 5otkT78iTxWk/lUttB9mag==
X-CSE-MsgGUID: 3fmEncnOSRSVDKK+BN7tWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="133601185"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 22:20:49 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u2Nri-0008H5-1s;
 Wed, 09 Apr 2025 05:20:46 +0000
Date: Wed, 9 Apr 2025 13:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, hamza.mahfooz@amd.com,
 chiahsuan.chung@amd.com, sunil.khatri@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, hersenxs.wu@amd.com,
 mario.limonciello@amd.com, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>
Subject: Re: [PATCH v2] drm/amd/display: Add error check for avi and vendor
 infoframe setup function
Message-ID: <202504091230.CXdkQbvK-lkp@intel.com>
References: <20250408022018.2786-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408022018.2786-1-vulab@iscas.ac.cn>
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

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.15-rc1 next-20250408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/drm-amd-display-Add-error-check-for-avi-and-vendor-infoframe-setup-function/20250408-102113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250408022018.2786-1-vulab%40iscas.ac.cn
patch subject: [PATCH v2] drm/amd/display: Add error check for avi and vendor infoframe setup function
config: csky-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504091230.CXdkQbvK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504091230.CXdkQbvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504091230.CXdkQbvK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from include/drm/display/drm_dp_helper.h:27,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:37,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:29:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'fill_stream_properties_from_drm_display_mode':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6221:42: error: passing argument 1 of '_dev_err' from incompatible pointer type [-Wincompatible-pointer-types]
    6221 |                         dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
         |                                 ~~~~~~~~~^~~~~
         |                                          |
         |                                          struct drm_device *
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6221:25: note: in expansion of macro 'dev_err'
    6221 |                         dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
         |                         ^~~~~~~
   include/linux/dev_printk.h:86:36: note: expected 'const struct device *' but argument is of type 'struct drm_device *'
      86 | void _dev_err(const struct device *dev, const char *fmt, ...)
         |               ~~~~~~~~~~~~~~~~~~~~~^~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6227:42: error: passing argument 1 of '_dev_err' from incompatible pointer type [-Wincompatible-pointer-types]
    6227 |                         dev_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
         |                                 ~~~~~~~~~^~~~~
         |                                          |
         |                                          struct drm_device *
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6227:25: note: in expansion of macro 'dev_err'
    6227 |                         dev_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
         |                         ^~~~~~~
   include/linux/dev_printk.h:86:36: note: expected 'const struct device *' but argument is of type 'struct drm_device *'
      86 | void _dev_err(const struct device *dev, const char *fmt, ...)
         |               ~~~~~~~~~~~~~~~~~~~~~^~~


vim +/_dev_err +6221 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  6156	
  6157	static void fill_stream_properties_from_drm_display_mode(
  6158		struct dc_stream_state *stream,
  6159		const struct drm_display_mode *mode_in,
  6160		const struct drm_connector *connector,
  6161		const struct drm_connector_state *connector_state,
  6162		const struct dc_stream_state *old_stream,
  6163		int requested_bpc)
  6164	{
  6165		struct dc_crtc_timing *timing_out = &stream->timing;
  6166		const struct drm_display_info *info = &connector->display_info;
  6167		struct amdgpu_dm_connector *aconnector = NULL;
  6168		struct hdmi_vendor_infoframe hv_frame;
  6169		struct hdmi_avi_infoframe avi_frame;
  6170		ssize_t err;
  6171	
  6172		if (connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
  6173			aconnector = to_amdgpu_dm_connector(connector);
  6174	
  6175		memset(&hv_frame, 0, sizeof(hv_frame));
  6176		memset(&avi_frame, 0, sizeof(avi_frame));
  6177	
  6178		timing_out->h_border_left = 0;
  6179		timing_out->h_border_right = 0;
  6180		timing_out->v_border_top = 0;
  6181		timing_out->v_border_bottom = 0;
  6182		/* TODO: un-hardcode */
  6183		if (drm_mode_is_420_only(info, mode_in)
  6184				&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
  6185			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
  6186		else if (drm_mode_is_420_also(info, mode_in)
  6187				&& aconnector
  6188				&& aconnector->force_yuv420_output)
  6189			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
  6190		else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR444)
  6191				&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
  6192			timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
  6193		else
  6194			timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
  6195	
  6196		timing_out->timing_3d_format = TIMING_3D_FORMAT_NONE;
  6197		timing_out->display_color_depth = convert_color_depth_from_display_info(
  6198			connector,
  6199			(timing_out->pixel_encoding == PIXEL_ENCODING_YCBCR420),
  6200			requested_bpc);
  6201		timing_out->scan_type = SCANNING_TYPE_NODATA;
  6202		timing_out->hdmi_vic = 0;
  6203	
  6204		if (old_stream) {
  6205			timing_out->vic = old_stream->timing.vic;
  6206			timing_out->flags.HSYNC_POSITIVE_POLARITY = old_stream->timing.flags.HSYNC_POSITIVE_POLARITY;
  6207			timing_out->flags.VSYNC_POSITIVE_POLARITY = old_stream->timing.flags.VSYNC_POSITIVE_POLARITY;
  6208		} else {
  6209			timing_out->vic = drm_match_cea_mode(mode_in);
  6210			if (mode_in->flags & DRM_MODE_FLAG_PHSYNC)
  6211				timing_out->flags.HSYNC_POSITIVE_POLARITY = 1;
  6212			if (mode_in->flags & DRM_MODE_FLAG_PVSYNC)
  6213				timing_out->flags.VSYNC_POSITIVE_POLARITY = 1;
  6214		}
  6215	
  6216		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
  6217			err = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
  6218								       (struct drm_connector *)connector,
  6219								       mode_in);
  6220			if (err < 0)
> 6221				dev_err(connector->dev, "Failed to setup avi infoframe: %zd\n", err);
  6222			timing_out->vic = avi_frame.video_code;
  6223			err = drm_hdmi_vendor_infoframe_from_display_mode(&hv_frame,
  6224									  (struct drm_connector *)connector,
  6225									  mode_in);
  6226			if (err < 0)
  6227				dev_err(connector->dev, "Failed to setup vendor infoframe: %zd\n", err);
  6228			timing_out->hdmi_vic = hv_frame.vic;
  6229		}
  6230	
  6231		if (aconnector && is_freesync_video_mode(mode_in, aconnector)) {
  6232			timing_out->h_addressable = mode_in->hdisplay;
  6233			timing_out->h_total = mode_in->htotal;
  6234			timing_out->h_sync_width = mode_in->hsync_end - mode_in->hsync_start;
  6235			timing_out->h_front_porch = mode_in->hsync_start - mode_in->hdisplay;
  6236			timing_out->v_total = mode_in->vtotal;
  6237			timing_out->v_addressable = mode_in->vdisplay;
  6238			timing_out->v_front_porch = mode_in->vsync_start - mode_in->vdisplay;
  6239			timing_out->v_sync_width = mode_in->vsync_end - mode_in->vsync_start;
  6240			timing_out->pix_clk_100hz = mode_in->clock * 10;
  6241		} else {
  6242			timing_out->h_addressable = mode_in->crtc_hdisplay;
  6243			timing_out->h_total = mode_in->crtc_htotal;
  6244			timing_out->h_sync_width = mode_in->crtc_hsync_end - mode_in->crtc_hsync_start;
  6245			timing_out->h_front_porch = mode_in->crtc_hsync_start - mode_in->crtc_hdisplay;
  6246			timing_out->v_total = mode_in->crtc_vtotal;
  6247			timing_out->v_addressable = mode_in->crtc_vdisplay;
  6248			timing_out->v_front_porch = mode_in->crtc_vsync_start - mode_in->crtc_vdisplay;
  6249			timing_out->v_sync_width = mode_in->crtc_vsync_end - mode_in->crtc_vsync_start;
  6250			timing_out->pix_clk_100hz = mode_in->crtc_clock * 10;
  6251		}
  6252	
  6253		timing_out->aspect_ratio = get_aspect_ratio(mode_in);
  6254	
  6255		stream->out_transfer_func.type = TF_TYPE_PREDEFINED;
  6256		stream->out_transfer_func.tf = TRANSFER_FUNCTION_SRGB;
  6257		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A) {
  6258			if (!adjust_colour_depth_from_display_info(timing_out, info) &&
  6259			    drm_mode_is_420_also(info, mode_in) &&
  6260			    timing_out->pixel_encoding != PIXEL_ENCODING_YCBCR420) {
  6261				timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
  6262				adjust_colour_depth_from_display_info(timing_out, info);
  6263			}
  6264		}
  6265	
  6266		stream->output_color_space = get_output_color_space(timing_out, connector_state);
  6267		stream->content_type = get_output_content_type(connector_state);
  6268	}
  6269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
