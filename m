Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE826DE7F4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 01:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E14D10E6CA;
	Tue, 11 Apr 2023 23:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A3610E375;
 Tue, 11 Apr 2023 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681255177; x=1712791177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5lWfbaukBY0AMGMSMLq4CSRNcNltmmEQeJtpDY+cJQU=;
 b=TD7i/8QXGQ3mBDYE+Zkv39pUmaJtBhPGky8XKFN6z0XQGefw4GSLNmji
 9ecW5Z3Wrl1HRZEKsTDPwXq2twUFBb7AmzOrwFFOWILvVmvyL6HYSDTNw
 ENHLkuP6yEDGiapto1Raz84w5JSPlIyd0qAka1EQQUnAWZLTw56Cl+lTW
 X9xSrjIrHnlV55l2+Cl6hPI7Gdmu/KRSDlzZVHalk8f3sEt9K2gzqSJyb
 cT3GnUI/W7JZ0e5l07lkGnD+adbBgQwN8guWLqoKWGTuD9TjqyBhwC+py
 HmQKeTIczJ83aCbUFWivcnutIstrbVB1UE5JBxnJKv7fn0vBaRHn4ALNU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343761862"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="343761862"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 16:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="721362136"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="721362136"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 11 Apr 2023 16:19:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pmNGt-000Wo1-2Y;
 Tue, 11 Apr 2023 23:19:31 +0000
Date: Wed, 12 Apr 2023 07:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v9 04/10] drm/hdcp: Expand HDCP helper library for
 enable/disable/check
Message-ID: <202304120709.oF7BKZuf-lkp@intel.com>
References: <20230411192134.508113-5-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411192134.508113-5-markyacoub@google.com>
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 oe-kbuild-all@lists.linux.dev, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm/drm-next linus/master v6.3-rc6 next-20230411]
[cannot apply to drm-tip/drm-tip drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230412-032412
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230411192134.508113-5-markyacoub%40google.com
patch subject: [PATCH v9 04/10] drm/hdcp: Expand HDCP helper library for enable/disable/check
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304120709.oF7BKZuf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/972a98f65fb56b3be4370593c2b81f1283750db7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230412-032412
        git checkout 972a98f65fb56b3be4370593c2b81f1283750db7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120709.oF7BKZuf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hdcp_helper.c:675:5: warning: no previous prototype for 'drm_hdcp_helper_hdcp1_capable_dp' [-Wmissing-prototypes]
     675 | int drm_hdcp_helper_hdcp1_capable_dp(struct drm_hdcp_helper_data *data,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/display/drm_hdcp_helper.c:1325:5: warning: no previous prototype for 'drm_hdcp_hdcp1_check_link_registers_dp' [-Wmissing-prototypes]
    1325 | int drm_hdcp_hdcp1_check_link_registers_dp(struct drm_device *dev,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_hdcp_helper_hdcp1_capable_dp +675 drivers/gpu/drm/display/drm_hdcp_helper.c

   674	
 > 675	int drm_hdcp_helper_hdcp1_capable_dp(struct drm_hdcp_helper_data *data,
   676					     bool *capable)
   677	{
   678		int ret;
   679		u8 bcaps;
   680	
   681		ret = data->display_type_funcs->remote_read(
   682			data, data->hdcp1_lut->bcaps, &bcaps, 1);
   683		*capable = !ret && (bcaps & DP_BCAPS_HDCP_CAPABLE);
   684	
   685		return 0;
   686	}
   687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
