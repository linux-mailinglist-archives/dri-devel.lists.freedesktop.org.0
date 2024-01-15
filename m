Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BAD82E2AD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 23:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBD210E062;
	Mon, 15 Jan 2024 22:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF46210E062
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 22:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705358376; x=1736894376;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=KKRIEU5WKaIBRlqCA5izg094N5snF9+a3kcG+Cgm7W8=;
 b=LIK5AYDq0ZZOzwqmrX/YzPZ9l4UBFgfpLfexP6go4yRCRLMk3qebKRPG
 n4Lpdg2LmUnQW0BKziF9K/MD+0czgCxEz8lFVmxzG+EVsF7b2EeWSmIJ+
 F80JYiyYLT4IvdGAGxWejras3kSngzeeW4G5XXiV8boCLpafiV3C2FgZN
 y0+sxTZBDdCmy7NwoQaFhQk6q2k0uvdXEtRUl4x568j9S6faQwRkbkdxM
 X+gYbzrGC6L2ffiQelDHynRoQeMwWTAtn42lBUVtATOWmxR0pTNxMyff0
 9k/ZveFn4/GltTRTH7NSkhbuo4mbYsEBLeWQ8/5SZbkXZOmajrFZ2pl+t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="21177420"
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="21177420"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 14:39:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,197,1695711600"; d="scan'208";a="32237975"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 15 Jan 2024 14:39:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rPVcA-000Cls-2l;
 Mon, 15 Jan 2024 22:39:30 +0000
Date: Tue, 16 Jan 2024 06:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: [drm-misc:drm-misc-next 6/21]
 drivers/gpu/drm/rockchip/inno_hdmi.c:499:13: warning: assignment makes
 pointer from integer without a cast
Message-ID: <202401160618.cgYEdslz-lkp@intel.com>
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
Cc: Alex Bee <knaerzche@gmail.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   ea489a3d983ba788c64712a55073d2a541e30d44
commit: d3e040f450ec8e46ff42fa495a433b976ab47686 [6/21] drm/rockchip: inno_hdmi: Get rid of mode_set
config: um-randconfig-r113-20240116 (https://download.01.org/0day-ci/archive/20240116/202401160618.cgYEdslz-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401160618.cgYEdslz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401160618.cgYEdslz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/rockchip/inno_hdmi.c: In function 'inno_hdmi_encoder_enable':
   drivers/gpu/drm/rockchip/inno_hdmi.c:499:15: error: implicit declaration of function 'drm_atomic_get_new_connector_state'; did you mean 'drm_atomic_helper_connector_reset'? [-Werror=implicit-function-declaration]
     conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  drm_atomic_helper_connector_reset
>> drivers/gpu/drm/rockchip/inno_hdmi.c:499:13: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
                ^
   drivers/gpu/drm/rockchip/inno_hdmi.c:503:15: error: implicit declaration of function 'drm_atomic_get_new_crtc_state'; did you mean 'drm_atomic_helper_swap_state'? [-Werror=implicit-function-declaration]
     crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  drm_atomic_helper_swap_state
   drivers/gpu/drm/rockchip/inno_hdmi.c:503:13: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
     crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
                ^
   cc1: some warnings being treated as errors


vim +499 drivers/gpu/drm/rockchip/inno_hdmi.c

   491	
   492	static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
   493					     struct drm_atomic_state *state)
   494	{
   495		struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
   496		struct drm_connector_state *conn_state;
   497		struct drm_crtc_state *crtc_state;
   498	
 > 499		conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
   500		if (WARN_ON(!conn_state))
   501			return;
   502	
   503		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
   504		if (WARN_ON(!crtc_state))
   505			return;
   506	
   507		inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
   508		inno_hdmi_set_pwr_mode(hdmi, NORMAL);
   509	}
   510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
