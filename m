Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B3805184
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 12:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB1C10E4EF;
	Tue,  5 Dec 2023 11:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17BA10E4EF;
 Tue,  5 Dec 2023 11:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701774327; x=1733310327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g2IiNCZKkf0z4VEVzhLMsiNKMJiqcRWCkCgz8VEIZa8=;
 b=iSL1IiQw7yye0S1eGCYZLaRu/RmF+SnBguKHAGzDEYHdU5VK1E0+zK/A
 vkgW93fQj38fhqQGwfaFi/0GO6UxOicbZsGj2LtGMuBZ9/yzn4UYr7/oe
 Y0G4ymuDsZj9DwKHDIFWrjzdYtM0Jh0Y/rxe+mXZ12KeGyCBTJvPqxnKz
 4Xbb9hp68SK6HaXuMUErgl2YTuLRtIIwyh3zPOdnER7Iu+PzQFyaOZOkC
 ogUCYjAvjfIKxR4+4mX017MeAnH9d333d3mQ6LTOVCpnO88yM8BWiDD4o
 4YoNPV1CWCcnBnZ5xlvF3SSF03vcU13wuymoHZ6vfX/mGu8JxIKh53gbx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="458199440"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="458199440"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 03:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861708568"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="861708568"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Dec 2023 03:05:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rATEs-0008pZ-3D;
 Tue, 05 Dec 2023 11:05:20 +0000
Date: Tue, 5 Dec 2023 19:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Message-ID: <202312051810.e0QCZPbY-lkp@intel.com>
References: <20231205023150.1581875-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205023150.1581875-2-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-atomic-helper-rename-drm_atomic_helper_check_wb_encoder_state/20231205-103552
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231205023150.1581875-2-dmitry.baryshkov%40linaro.org
patch subject: [PATCH v2 1/2] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
config: i386-buildonly-randconfig-003-20231205 (https://download.01.org/0day-ci/archive/20231205/202312051810.e0QCZPbY-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051810.e0QCZPbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051810.e0QCZPbY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_atomic_helper.c:811: warning: Function parameter or member 'wb_conn' not described in 'drm_atomic_helper_check_wb_connector_state'
>> drivers/gpu/drm/drm_atomic_helper.c:811: warning: Excess function parameter 'connector' description in 'drm_atomic_helper_check_wb_connector_state'


vim +811 drivers/gpu/drm/drm_atomic_helper.c

623369e533e8a5 Daniel Vetter    2014-09-16  796  
254fe9c106ed69 Igor Torrente    2022-09-05  797  /**
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  798   * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  799   * @connector: corresponding connector
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  800   * @state: the driver state object
254fe9c106ed69 Igor Torrente    2022-09-05  801   *
254fe9c106ed69 Igor Torrente    2022-09-05  802   * Checks if the writeback connector state is valid, and returns an error if it
254fe9c106ed69 Igor Torrente    2022-09-05  803   * isn't.
254fe9c106ed69 Igor Torrente    2022-09-05  804   *
254fe9c106ed69 Igor Torrente    2022-09-05  805   * RETURNS:
254fe9c106ed69 Igor Torrente    2022-09-05  806   * Zero for success or -errno
254fe9c106ed69 Igor Torrente    2022-09-05  807   */
254fe9c106ed69 Igor Torrente    2022-09-05  808  int
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  809  drm_atomic_helper_check_wb_connector_state(struct drm_writeback_connector *wb_conn,
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  810  					   struct drm_atomic_state *state)
254fe9c106ed69 Igor Torrente    2022-09-05 @811  {
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  812  	struct drm_connector_state *conn_state =
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  813  		drm_atomic_get_new_connector_state(state, &wb_conn->base);
254fe9c106ed69 Igor Torrente    2022-09-05  814  	struct drm_writeback_job *wb_job = conn_state->writeback_job;
254fe9c106ed69 Igor Torrente    2022-09-05  815  	struct drm_property_blob *pixel_format_blob;
254fe9c106ed69 Igor Torrente    2022-09-05  816  	struct drm_framebuffer *fb;
254fe9c106ed69 Igor Torrente    2022-09-05  817  	size_t i, nformats;
254fe9c106ed69 Igor Torrente    2022-09-05  818  	u32 *formats;
254fe9c106ed69 Igor Torrente    2022-09-05  819  
254fe9c106ed69 Igor Torrente    2022-09-05  820  	if (!wb_job || !wb_job->fb)
254fe9c106ed69 Igor Torrente    2022-09-05  821  		return 0;
254fe9c106ed69 Igor Torrente    2022-09-05  822  
254fe9c106ed69 Igor Torrente    2022-09-05  823  	pixel_format_blob = wb_job->connector->pixel_formats_blob_ptr;
254fe9c106ed69 Igor Torrente    2022-09-05  824  	nformats = pixel_format_blob->length / sizeof(u32);
254fe9c106ed69 Igor Torrente    2022-09-05  825  	formats = pixel_format_blob->data;
254fe9c106ed69 Igor Torrente    2022-09-05  826  	fb = wb_job->fb;
254fe9c106ed69 Igor Torrente    2022-09-05  827  
254fe9c106ed69 Igor Torrente    2022-09-05  828  	for (i = 0; i < nformats; i++)
254fe9c106ed69 Igor Torrente    2022-09-05  829  		if (fb->format->format == formats[i])
254fe9c106ed69 Igor Torrente    2022-09-05  830  			return 0;
254fe9c106ed69 Igor Torrente    2022-09-05  831  
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  832  	drm_dbg_kms(wb_conn->base.dev, "Invalid pixel format %p4cc\n", &fb->format->format);
254fe9c106ed69 Igor Torrente    2022-09-05  833  
254fe9c106ed69 Igor Torrente    2022-09-05  834  	return -EINVAL;
254fe9c106ed69 Igor Torrente    2022-09-05  835  }
d538670e1a27f5 Dmitry Baryshkov 2023-12-05  836  EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
254fe9c106ed69 Igor Torrente    2022-09-05  837  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
