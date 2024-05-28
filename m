Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E807D8D1ECE
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE8110E17A;
	Tue, 28 May 2024 14:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFsriASd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE98410E17A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716906595; x=1748442595;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=etY8PFF/30Ei9O/eLuC3PupFCJbEZLmQs9oe8UQCVCk=;
 b=QFsriASdu5KKjMMYUqLMsRQZOWrl2zvvDSRzDaGfWbJ21rkCPJYwyJCN
 UkoJSKi0b+pT+Y9DkCHw6fjpz0KwcSZEmmwghbGH28H0Q3JFU1Uvl0d5z
 NL4d+qw695x3jikdA4cJIqT8w6RBSzR7rSj/lsTdHKd2O4t8xxYerPxlr
 qonv2jg/Oj5sluxBij++CCY06uagFUCXdXvBUINMSdFwfZJ4E3WKvhox2
 atDpZNff8C2fgI/oIbffYz74jtldU1+fUmHOKUmodAcUdVJdlH5knlpEB
 Z2xvPew+7GrdbJzEthk6ZgJIa+66vmXXQFDcBcx98p6aj/Yf27C/QH8bA g==;
X-CSE-ConnectionGUID: R3XxH5G3S9WjVZArYNDydA==
X-CSE-MsgGUID: /eqSjmbjQgqlpI9KeazJ9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24382141"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="24382141"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 07:29:54 -0700
X-CSE-ConnectionGUID: NPIss38JTfKlY14dJBDM/Q==
X-CSE-MsgGUID: APcymktLS0S+zQiXcNiGBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="66297566"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by fmviesa001.fm.intel.com with ESMTP; 28 May 2024 07:29:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sBxpl-000CKh-0t;
 Tue, 28 May 2024 14:29:49 +0000
Date: Tue, 28 May 2024 22:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Yan <andyshrk@163.com>
Subject: [drm-misc:drm-misc-next 29/29]
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:17: error: implicit declaration
 of function 'drm_connector_hdmi_compute_mode_clock'; did you mean
 'drm_hdmi_compute_mode_clock'?
Message-ID: <202405282248.U2lhPvCK-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240528/202405282248.U2lhPvCK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405282248.U2lhPvCK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282248.U2lhPvCK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c: In function 'sun4i_hdmi_connector_mode_valid':
>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:17: error: implicit declaration of function 'drm_connector_hdmi_compute_mode_clock'; did you mean 'drm_hdmi_compute_mode_clock'? [-Werror=implicit-function-declaration]
     213 |                 drm_connector_hdmi_compute_mode_clock(mode, 8,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 drm_hdmi_compute_mode_clock
   cc1: all warnings being treated as errors


vim +213 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c

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
