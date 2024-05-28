Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C818D1EFE
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B892A10E1FF;
	Tue, 28 May 2024 14:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBfrVXQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B34510E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716907140; x=1748443140;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=M6zz23ytNcIYjpmOBVGRwLDdpmrQad24JbGnhp4sZto=;
 b=MBfrVXQLqGNj93tVkL3ijrm0Ud/rINmeD30m9h4QKzMyopn1GoJU+aki
 vPCC7XPaI86DWMdlAf4EDNNV8nq4UX12tP8X7i7xmOCE1U068VozbDz4Q
 jZo17V1oJ8BM03yqtHFnoSqqtyfUFdKSLNNC0Gy7na0BBcV3fvR5bcjKQ
 TUlsibjdFQDGbLMg8uaERwsTCJajRwYfHfWHYT5iZMKTapuMXFlH/1HDq
 Yk9xY9VCMLnP8xM9krgYVaLDQVwaZrq6l7HAAWrpEzhJsig3PHJrBO94Z
 sYZyWoIbCl1VuyKShfMDOe7YbfiKKAW0AHWk1ovHc+muFR+5dlN7ZpGI5 g==;
X-CSE-ConnectionGUID: 22J9TanmTaG9S+FqZeA2zA==
X-CSE-MsgGUID: nLabYhJsTnaQCAsoPh6VAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13097646"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13097646"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:38:58 -0700
X-CSE-ConnectionGUID: dA1SJRMtSvSOTk2Fpy2o+Q==
X-CSE-MsgGUID: 53UMXH7CRJGOnwsVBk8ANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="40056247"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 28 May 2024 07:38:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sBxyY-000CL3-0s;
 Tue, 28 May 2024 14:38:54 +0000
Date: Tue, 28 May 2024 22:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andyshrk@163.com>
Subject: [drm-misc:drm-misc-next 29/29]
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:3: error: implicit declaration of
 function 'drm_connector_hdmi_compute_mode_clock' is invalid in C99
Message-ID: <202405282205.EU7NUoeQ-lkp@intel.com>
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
head:   62545c719e26ec9f62efab7e9582deb73265b6d0
commit: ea64761a54a25fa2c27bae99b3c72dadfaa74d3e [29/29] drm/sun4i: hdmi: Switch to HDMI connector
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240528/202405282205.EU7NUoeQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405282205.EU7NUoeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282205.EU7NUoeQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:3: error: implicit declaration of function 'drm_connector_hdmi_compute_mode_clock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_connector_hdmi_compute_mode_clock(mode, 8,
                   ^
   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:3: note: did you mean 'drm_hdmi_compute_mode_clock'?
   include/drm/display/drm_hdmi_helper.h:28:1: note: 'drm_hdmi_compute_mode_clock' declared here
   drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
   ^
   1 error generated.


vim +/drm_connector_hdmi_compute_mode_clock +213 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c

   207	
   208	static enum drm_mode_status
   209	sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
   210					struct drm_display_mode *mode)
   211	{
   212		unsigned long long rate =
 > 213			drm_connector_hdmi_compute_mode_clock(mode, 8,
   214							      HDMI_COLORSPACE_RGB);
   215	
   216		return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
