Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C66D2C0C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 02:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7EC10F35A;
	Sat,  1 Apr 2023 00:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D0010F357;
 Sat,  1 Apr 2023 00:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680308408; x=1711844408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i+fMdauhfahN1aZCfVPkPAeQqjT40gdgL5LTsfvPY/s=;
 b=bv+oVViHC+Hk+jCAF1sb/o22TCsGTgUDA8ygdHcwU3OJq6uA6ewOsUBm
 HGl199s5JVpS1PpXhS+fAFCdBiZ2me7fsjpXRAP9RumWXBBdqvCRuxhvr
 S/U1EGSi/cm4EzLmwmneCp24aB1B5WT9tK9yBF6PUnDii4U2xVWUd///z
 88ztTYV16Yi/Y8U49Q1bUCLHcxQyCT2WnHNb3d2K5o5vkTwVgY/J9nZa6
 efTQ7UjXrV0HlkiqoGTVuqYwJPnthkMz1Itvbg4XW77+Iy/aWpYBzFJdu
 DIrO/e+fgkvQrlIutVFp8uBXDGbI1oikkdPHapPT7yJnHcYtlXDDGfz3M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="344128910"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="344128910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="662581327"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="662581327"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2023 17:20:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1piOyQ-000MIf-2t;
 Sat, 01 Apr 2023 00:20:02 +0000
Date: Sat, 1 Apr 2023 08:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v8 04/10] drm/hdcp: Expand HDCP helper library for
 enable/disable/check
Message-ID: <202304010815.5iVFI5nv-lkp@intel.com>
References: <20230331221213.1691997-5-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331221213.1691997-5-markyacoub@google.com>
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
 oe-kbuild-all@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next-fixes]
[also build test WARNING on drm/drm-next linus/master v6.3-rc4 next-20230331]
[cannot apply to drm-misc/drm-misc-next drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230401-061425
base:   git://anongit.freedesktop.org/drm-intel for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20230331221213.1691997-5-markyacoub%40google.com
patch subject: [PATCH v8 04/10] drm/hdcp: Expand HDCP helper library for enable/disable/check
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230401/202304010815.5iVFI5nv-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/82a092e7e090cdeb3ff18498e6ad671906268631
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mark-Yacoub/drm-hdcp-Add-drm_hdcp_atomic_check/20230401-061425
        git checkout 82a092e7e090cdeb3ff18498e6ad671906268631
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/display/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304010815.5iVFI5nv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hdcp_helper.c:719: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check if the sink is capable of HDCP 1.x. DisplayPort has a dedicated bit
   drivers/gpu/drm/display/drm_hdcp_helper.c:742: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Check if the sink is capable of HDCP 1.x. HDMI spec states that transmitters
   drivers/gpu/drm/display/drm_hdcp_helper.c:1633: warning: Function parameter or member 'aux' not described in 'drm_hdcp_helper_initialize_dp'


vim +719 drivers/gpu/drm/display/drm_hdcp_helper.c

   717	
   718	/**
 > 719	 * Check if the sink is capable of HDCP 1.x. DisplayPort has a dedicated bit
   720	 * for this in DPCD.
   721	 *
   722	 * @data: pointer to the HDCP helper data.
   723	 * @capable: pointer to a bool which will contain true if the sink is capable.
   724	 *
   725	 * Returns:
   726	 * -errno if the transacation between source and sink fails.
   727	 */
   728	int drm_hdcp_helper_hdcp1_capable_dp(struct drm_hdcp_helper_data *data,
   729					     bool *capable)
   730	{
   731		int ret;
   732		u8 bcaps;
   733	
   734		ret = data->funcs->remote_read(data, data->hdcp1_lut->bcaps, &bcaps, 1);
   735		*capable = !ret && (bcaps & DP_BCAPS_HDCP_CAPABLE);
   736	
   737		return 0;
   738	}
   739	EXPORT_SYMBOL(drm_hdcp_helper_hdcp1_capable_dp);
   740	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
