Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2D86C86A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7EB10E112;
	Thu, 29 Feb 2024 11:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bqniiIGK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B1E10E112
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709207291; x=1740743291;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=FMzv0FtmUzxhyUrE/CNu+kff5l2BZLY3vQle/Lfv1Hw=;
 b=bqniiIGKXsAJ4H3+0qnY4/F69id7jyEpnbbg46hRff6zu5JnecmJhSOn
 7ZzmkWN/iC1YmZNy3PX661FpV19HIRgUzmm7tA7ai8haW/3+cMPyQrrfD
 1X7en8V8wmBxCu2g2A2Vy+9m908UFUfd+NWFBKWMpkONEKymBQBeKRlsf
 G9GuTZUBr/tReKv0Kv2Jw6wVtppYlQNqLliZpBenW66nouZIhYdZ0BMHi
 lpN2ljUTjufVRqVI/EJ+AgFXYO5SXcXOJ6L/XFSnumfxmTl5kYKzM+s9a
 1X69/0xA/i7kzVrJghnA5tpdMUaPh8tnEBpLyMH0zT2jTtXIR4q1FynRn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14307061"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14307061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 03:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12370575"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
 by fmviesa005.fm.intel.com with ESMTP; 29 Feb 2024 03:48:08 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rfetS-000Cu5-23;
 Thu, 29 Feb 2024 11:48:06 +0000
Date: Thu, 29 Feb 2024 19:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [drm-misc:drm-misc-next 4/5]
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:191:17: error: implicit declaration
 of function 'drm_atomic_get_new_connector_state'; did you mean
 'drm_atomic_helper_connector_reset'?
Message-ID: <202402291942.zVb1Vx4Y-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   be318d01a90366029e181068e8857c6252e1fadc
commit: 358e76fd613a762bdba18b6b9fb0469a481de3a3 [4/5] drm/sun4i: hdmi: Consolidate atomic_check and mode_valid
config: xtensa-randconfig-002-20240229 (https://download.01.org/0day-ci/archive/20240229/202402291942.zVb1Vx4Y-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402291942.zVb1Vx4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402291942.zVb1Vx4Y-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c: In function 'sun4i_hdmi_connector_atomic_check':
>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:191:17: error: implicit declaration of function 'drm_atomic_get_new_connector_state'; did you mean 'drm_atomic_helper_connector_reset'? [-Werror=implicit-function-declaration]
     191 |                 drm_atomic_get_new_connector_state(state, connector);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 drm_atomic_helper_connector_reset
>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:191:17: warning: initialization of 'struct drm_connector_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   cc1: some warnings being treated as errors


vim +191 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c

   186	
   187	static int sun4i_hdmi_connector_atomic_check(struct drm_connector *connector,
   188						     struct drm_atomic_state *state)
   189	{
   190		struct drm_connector_state *conn_state =
 > 191			drm_atomic_get_new_connector_state(state, connector);
   192		struct drm_crtc *crtc = conn_state->crtc;
   193		struct drm_crtc_state *crtc_state = crtc->state;
   194		struct drm_display_mode *mode = &crtc_state->adjusted_mode;
   195		enum drm_mode_status status;
   196	
   197		status = sun4i_hdmi_connector_clock_valid(connector, mode,
   198							  mode->clock * 1000);
   199		if (status != MODE_OK)
   200			return -EINVAL;
   201	
   202		return 0;
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
