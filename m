Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D527DEBB3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 05:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738A410E7F5;
	Thu,  2 Nov 2023 04:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800E010E800
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 04:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698898533; x=1730434533;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pW7IEzkHLClJbmSBnBXg6mayrfNDlf19EbAfy1ucljc=;
 b=klaXcZ5pKJPOtqad6FY/FByqrc0zktJH7/i60IfmAaJmLaNqiBqGoUDm
 t/8z0ZxrWxF30td3Z1Cv3ltTK/VBKpxxz0flu5G7i8cmUWWklkbzgCgdr
 VBgYhrXfL1zaKE0zaA6LPSSizUJYQNf/CnMnxuRHNYorr73zOZzpz6Rxh
 TwCqo8CO6DFK1uWWkPJddAjr2sq1gzO3bKqGH/gprPUkLq547y1rTc4sK
 J+AkLHmDdRoZs1yYhaAABiXtORZ9hI0S3X+ZC2pmfXASZRhyAIRm9a6hZ
 GsVrynory/Ukdppd0Ck17FDrAxq5vj3nO15CgyOITN94vxcdMO4JwkbrP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452930173"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; d="scan'208";a="452930173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 21:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="2404053"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2023 21:15:29 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qyP79-00016M-1Q;
 Thu, 02 Nov 2023 04:15:27 +0000
Date: Thu, 2 Nov 2023 12:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
Message-ID: <202311021208.ekIThlkq-lkp@intel.com>
References: <20231101212604.1636517-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101212604.1636517-4-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, oe-kbuild-all@lists.linux.dev,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to linus/master v6.6 next-20231101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hsin-Yi-Wang/drm-panel-edp-Add-several-generic-edp-panels/20231102-053007
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231101212604.1636517-4-hsinyi%40chromium.org
patch subject: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
config: arc-randconfig-001-20231102 (https://download.01.org/0day-ci/archive/20231102/202311021208.ekIThlkq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021208.ekIThlkq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021208.ekIThlkq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_modes.c:1944: warning: expecting prototype for drm_mode_unset_preferred(). Prototype was for drm_mode_unset_preferred_modes() instead


vim +1944 drivers/gpu/drm/drm_modes.c

  1935	
  1936	/**
  1937	 * drm_mode_unset_preferred - clear the preferred status on existing modes.
  1938	 * @connector: the connector to update
  1939	 *
  1940	 * Walk the mode list for connector, clearing the preferred status on existing
  1941	 * modes.
  1942	 */
  1943	void drm_mode_unset_preferred_modes(struct drm_connector *connector)
> 1944	{
  1945		struct drm_display_mode *cur_mode;
  1946	
  1947		list_for_each_entry(cur_mode, &connector->probed_modes, head)
  1948			cur_mode->type &= ~DRM_MODE_TYPE_PREFERRED;
  1949	}
  1950	EXPORT_SYMBOL_GPL(drm_mode_unset_preferred_modes);
  1951	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
