Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB3A4E78C7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 17:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92D310E99B;
	Fri, 25 Mar 2022 16:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3FA10E99B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 16:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648225051; x=1679761051;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zma2sXcPbo3FXq79eHGjfg8Bv252f8d9RrvVyUUXXRE=;
 b=YbPy9Oaa91qubfBuHd0Rb4MTT8k5SgWpXi1IK2aPWnE7AZL0gydqrqje
 vvU3ntWRsKh/rhDLAYgtF1rQBBCsuXtcWn6yDvBMchy+jZ6UiA+epQNFR
 m9Ub+t2g9qCddxmWag+JeJe3VbmqrIXHPmPXuefihSIWGD66+NC3s7omt
 HwSN6osYJYGMuuv7cS/8YB7kAIcIhC6cg+bhrxENpRoOhBhfugrYCrm/J
 gnqSUT6ufJ0koPAcYgIr3tQUMqLQHFMJGPLSlIwZDjNU3lQIMSuKExc7G
 a5ea03sITnYh+5/VjyE22+SDWCJdjRubR3SZezE1vTZHtKsGzZZBTXgAp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="238605161"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="238605161"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 09:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="501826627"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 25 Mar 2022 09:15:30 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nXmb3-000MMf-U0; Fri, 25 Mar 2022 16:15:29 +0000
Date: Sat, 26 Mar 2022 00:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] drm/atomic: Add atomic_print_state to private
 objects
Message-ID: <202203260001.Gfx0MJJ4-lkp@intel.com>
References: <20220325124822.1785070-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325124822.1785070-3-maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip v5.17 next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Maxime-Ripard/drm-atomic-Atomic-Private-State-debugging/20220325-205019
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: ia64-defconfig (https://download.01.org/0day-ci/archive/20220326/202203260001.Gfx0MJJ4-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/dc4288c88376cba127b0280246b77566b18d9f1d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Maxime-Ripard/drm-atomic-Atomic-Private-State-debugging/20220325-205019
        git checkout dc4288c88376cba127b0280246b77566b18d9f1d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_atomic.c: In function 'drm_atomic_print_new_state':
>> drivers/gpu/drm/drm_atomic.c:1670:33: warning: variable 'obj' set but not used [-Wunused-but-set-variable]
    1670 |         struct drm_private_obj *obj;
         |                                 ^~~


vim +/obj +1670 drivers/gpu/drm/drm_atomic.c

  1649	
  1650	/**
  1651	 * drm_atomic_print_new_state - prints drm atomic state
  1652	 * @state: atomic configuration to check
  1653	 * @p: drm printer
  1654	 *
  1655	 * This functions prints the drm atomic state snapshot using the drm printer
  1656	 * which is passed to it. This snapshot can be used for debugging purposes.
  1657	 *
  1658	 * Note that this function looks into the new state objects and hence its not
  1659	 * safe to be used after the call to drm_atomic_helper_commit_hw_done().
  1660	 */
  1661	void drm_atomic_print_new_state(const struct drm_atomic_state *state,
  1662			struct drm_printer *p)
  1663	{
  1664		struct drm_plane *plane;
  1665		struct drm_plane_state *plane_state;
  1666		struct drm_crtc *crtc;
  1667		struct drm_crtc_state *crtc_state;
  1668		struct drm_connector *connector;
  1669		struct drm_connector_state *connector_state;
> 1670		struct drm_private_obj *obj;
  1671		struct drm_private_state *obj_state;
  1672		int i;
  1673	
  1674		if (!p) {
  1675			drm_err(state->dev, "invalid drm printer\n");
  1676			return;
  1677		}
  1678	
  1679		drm_dbg_atomic(state->dev, "checking %p\n", state);
  1680	
  1681		for_each_new_plane_in_state(state, plane, plane_state, i)
  1682			drm_atomic_plane_print_state(p, plane_state);
  1683	
  1684		for_each_new_crtc_in_state(state, crtc, crtc_state, i)
  1685			drm_atomic_crtc_print_state(p, crtc_state);
  1686	
  1687		for_each_new_connector_in_state(state, connector, connector_state, i)
  1688			drm_atomic_connector_print_state(p, connector_state);
  1689	
  1690		for_each_new_private_obj_in_state(state, obj, obj_state, i)
  1691			drm_atomic_private_obj_print_state(p, obj_state);
  1692	}
  1693	EXPORT_SYMBOL(drm_atomic_print_new_state);
  1694	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
