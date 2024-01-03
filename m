Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6071823676
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 21:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A4A10E332;
	Wed,  3 Jan 2024 20:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9F110E332
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704313314; x=1735849314;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vgm8K58iZ83lULNb8SnKKP0qiNGCo1sVMEr08z4LBCs=;
 b=AMg2N5hIoMObcZBAb217U/RTDmHflndNsVyF9lLjqXokaFxYpchyojnG
 o0pkcANp5qSX1CvXBC+o3VhiS7IHQhEClQMalg5oir2QQ0JyTmLGTKopm
 3vX3zLCM8Q435HFNriL6f4DL2oNyWQuXeJ/uZN7jLKb2q5fTIXmqipVhA
 pdvPN8xjCDueJ1XIIJ+osALDQiJCdkdp2MFgD9Zev8GvnN0n0wYqdeGSb
 qvlax7ZIAYJRUSw6ANPHPFGnP2eLEo6PnPDxmmtGiIydy5zq9+dVMBCoJ
 bfVb/1AIAcLVgcAUrl5XT1sVizfVpgq0GTlE2Fj7bYrKuAxLWIvsqMDUt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="3829990"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; 
   d="scan'208";a="3829990"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 12:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="780094216"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="780094216"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 03 Jan 2024 12:21:51 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rL7kL-000MWW-0v;
 Wed, 03 Jan 2024 20:21:49 +0000
Date: Thu, 4 Jan 2024 04:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v2 23/39] drm/bridge: nxp-ptn3460: switch to ->edid_read
 callback
Message-ID: <202401040455.PPhqJiVr-lkp@intel.com>
References: <87fb7fd52d087dd9a15b7194f3915b6b1c4146d6.1704276309.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fb7fd52d087dd9a15b7194f3915b6b1c4146d6.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.7-rc8 next-20240103]
[cannot apply to drm-intel/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-bridge-add-edid_read-hook-and-drm_bridge_edid_read/20240103-181513
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/87fb7fd52d087dd9a15b7194f3915b6b1c4146d6.1704276309.git.jani.nikula%40intel.com
patch subject: [PATCH v2 23/39] drm/bridge: nxp-ptn3460: switch to ->edid_read callback
config: arm-randconfig-001-20240103 (https://download.01.org/0day-ci/archive/20240104/202401040455.PPhqJiVr-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240104/202401040455.PPhqJiVr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401040455.PPhqJiVr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/nxp-ptn3460.c:170:6: warning: variable 'drm_edid' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     170 |         if (!edid) {
         |             ^~~~~
   drivers/gpu/drm/bridge/nxp-ptn3460.c:189:9: note: uninitialized use occurs here
     189 |         return drm_edid;
         |                ^~~~~~~~
   drivers/gpu/drm/bridge/nxp-ptn3460.c:170:2: note: remove the 'if' if its condition is always false
     170 |         if (!edid) {
         |         ^~~~~~~~~~~~
     171 |                 DRM_ERROR("Failed to allocate EDID\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     172 |                 goto out;
         |                 ~~~~~~~~~
     173 |         }
         |         ~
   drivers/gpu/drm/bridge/nxp-ptn3460.c:161:33: note: initialize the variable 'drm_edid' to silence this warning
     161 |         const struct drm_edid *drm_edid;
         |                                        ^
         |                                         = NULL
   1 warning generated.


vim +170 drivers/gpu/drm/bridge/nxp-ptn3460.c

a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  155  
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  156  
dd6c2ed9dace84 drivers/gpu/drm/bridge/nxp-ptn3460.c Jani Nikula  2024-01-03  157  static const struct drm_edid *ptn3460_edid_read(struct drm_bridge *bridge,
4151c14cdda689 drivers/gpu/drm/bridge/nxp-ptn3460.c Sam Ravnborg 2020-07-27  158  						struct drm_connector *connector)
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  159  {
4151c14cdda689 drivers/gpu/drm/bridge/nxp-ptn3460.c Sam Ravnborg 2020-07-27  160  	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
dd6c2ed9dace84 drivers/gpu/drm/bridge/nxp-ptn3460.c Jani Nikula  2024-01-03  161  	const struct drm_edid *drm_edid;
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  162  	bool power_off;
4151c14cdda689 drivers/gpu/drm/bridge/nxp-ptn3460.c Sam Ravnborg 2020-07-27  163  	u8 *edid;
4151c14cdda689 drivers/gpu/drm/bridge/nxp-ptn3460.c Sam Ravnborg 2020-07-27  164  	int ret;
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  165  
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  166  	power_off = !ptn_bridge->enabled;
94d50d57c4403a drivers/gpu/drm/bridge/ptn3460.c     Ajay Kumar   2015-01-20  167  	ptn3460_pre_enable(&ptn_bridge->bridge);
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  168  
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  169  	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24 @170  	if (!edid) {
94d50d57c4403a drivers/gpu/drm/bridge/ptn3460.c     Ajay Kumar   2015-01-20  171  		DRM_ERROR("Failed to allocate EDID\n");
4151c14cdda689 drivers/gpu/drm/bridge/nxp-ptn3460.c Sam Ravnborg 2020-07-27  172  		goto out;
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  173  	}
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  174  
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  175  	ret = ptn3460_read_bytes(ptn_bridge, PTN3460_EDID_ADDR, edid,
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  176  				 EDID_LENGTH);
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  177  	if (ret) {
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  178  		kfree(edid);
dd6c2ed9dace84 drivers/gpu/drm/bridge/nxp-ptn3460.c Jani Nikula  2024-01-03  179  		drm_edid = NULL;
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  180  		goto out;
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  181  	}
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  182  
dd6c2ed9dace84 drivers/gpu/drm/bridge/nxp-ptn3460.c Jani Nikula  2024-01-03  183  	drm_edid = drm_edid_alloc(edid, EDID_LENGTH);
dd6c2ed9dace84 drivers/gpu/drm/bridge/nxp-ptn3460.c Jani Nikula  2024-01-03  184  
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  185  out:
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  186  	if (power_off)
94d50d57c4403a drivers/gpu/drm/bridge/ptn3460.c     Ajay Kumar   2015-01-20  187  		ptn3460_disable(&ptn_bridge->bridge);
a9fe713d7d45c6 drivers/gpu/drm/bridge/ptn3460.c     Sean Paul    2014-02-24  188  
dd6c2ed9dace84 drivers/gpu/drm/bridge/nxp-ptn3460.c Jani Nikula  2024-01-03  189  	return drm_edid;
4151c14cdda689 drivers/gpu/drm/bridge/nxp-ptn3460.c Sam Ravnborg 2020-07-27  190  }
4151c14cdda689 drivers/gpu/drm/bridge/nxp-ptn3460.c Sam Ravnborg 2020-07-27  191  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
