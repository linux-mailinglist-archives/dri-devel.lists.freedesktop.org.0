Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0F26E930E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 13:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A39810E257;
	Thu, 20 Apr 2023 11:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5B10E20B;
 Thu, 20 Apr 2023 11:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681990785; x=1713526785;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yVyrMJN1Iigkd+tJFiSwN+cWLKzO4jFI/hFaT3f7kbA=;
 b=KFBGlUHX6wwKJyq2JbrQNwyEGYRZDt4rxotmigqk48+yz6Dk7+oLh/Om
 b/Xfn2xnbdcSsQbMEzpeL+Lnah63j6yaV35yrFgI6M69ZA4jvrPANYNII
 fZw2URWs67bbhO24BvI8DjwieUxHUqc+R/fPsJZbrTFgfM8kx+PKnDjVq
 yfS+yikpNyiEQ/2o4NXjfev+01sMNPqmCoooIig5sdv+XrRJ7Hnm/hduz
 sIk/q6yCInpruQLdxqV3Xsk/soTumqS2eFOzIRrEXoVs5UcvrPJsu2yu8
 q50Yh3DLwsZ2rcGLa0sCmxEqiEm5uWOBVGatWBs1puZIxI7lAIn2IPn69 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347572004"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="347572004"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 04:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815986146"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="815986146"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 20 Apr 2023 04:39:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ppSdX-000fnQ-1P;
 Thu, 20 Apr 2023 11:39:39 +0000
Date: Thu, 20 Apr 2023 19:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v10 10/10] drm/msm: Implement HDCP 1.x using the new drm
 HDCP helpers
Message-ID: <202304201909.D57x63J5-lkp@intel.com>
References: <20230419154321.1993419-11-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419154321.1993419-11-markyacoub@google.com>
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
Cc: suraj.kandpal@intel.com, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, seanpaul@chromium.org,
 oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next-fixes]
[also build test ERROR on linus/master v6.3-rc7]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next drm/drm-next next-20230419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230419-234833
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230419154321.1993419-11-markyacoub%40google.com
patch subject: [PATCH v10 10/10] drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
config: ia64-randconfig-r011-20230416 (https://download.01.org/0day-ci/archive/20230420/202304201909.D57x63J5-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6fb5b032262769c786a7a8c9ed522d936dcf14c2
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230419-234833
        git checkout 6fb5b032262769c786a7a8c9ed522d936dcf14c2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201909.D57x63J5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ia64-linux-ld: ia64-linux-ld: DWARF error: could not find abbrev number 1548101
   drivers/gpu/drm/msm/msm_atomic.o: in function `msm_atomic_commit_tail':
>> msm_atomic.c:(.text+0xe02): undefined reference to `dp_drm_is_bridge_msm_dp'
>> ia64-linux-ld: msm_atomic.c:(.text+0xe22): undefined reference to `dp_drm_atomic_commit'
   ia64-linux-ld: ia64-linux-ld: DWARF error: could not find abbrev number 872
   drivers/gpu/drm/msm/dp/dp_debug.o: in function `dp_hdcp_key_write':
>> dp_debug.c:(.text+0xa2): undefined reference to `dp_hdcp_ingest_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
