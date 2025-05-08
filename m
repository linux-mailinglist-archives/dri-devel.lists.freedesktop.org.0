Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3945AB02F9
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEBF10E95D;
	Thu,  8 May 2025 18:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+or+n09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE35B10E95C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 18:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746729458; x=1778265458;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LVtUUN2MrfsyK80smjhH6AaJQhd0Umzk+ryvBq/tDD0=;
 b=Q+or+n09OLeMPiby1Pe9Xo/gxKDri1SAgwHWGPX6kfefuHKf2kU9GUIS
 38BLSqBUr3q+BxI8g7VposP5ChKAPO0897GL3qjxIuU00bXiv+0wWWjZy
 etvWMxluAhypMG3nlubxr2x7WJHyrraA/IjMc5lZtENcOqhktsyaR4AoC
 chLDUYQvRqsCJ6cPxC7wlFOKenoV6z0rTvGQPCGiSPlaayce7e9m75Het
 /8EeizieWCjKElVTKq2rRWT8+VGcPlUnFLE0564igFVpNM1jOTupiYil8
 N7spJqbnyp62MqedgtQvPaFw6LCkFWrQJyuXYsnNbnrUo2TlqVkBtI3yi A==;
X-CSE-ConnectionGUID: Q3P7PH32RBOeh/fCF6/mqg==
X-CSE-MsgGUID: 8lEHltCQRMi7HCMOD4ZvUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="65949381"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="65949381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 11:37:36 -0700
X-CSE-ConnectionGUID: z4vP90/9SX26Xj5i1zn72w==
X-CSE-MsgGUID: JwEnOJrdQlmA6ZPuj15nnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; d="scan'208";a="159678634"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa002.fm.intel.com with ESMTP; 08 May 2025 11:37:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uD67d-000BGX-17;
 Thu, 08 May 2025 18:37:29 +0000
Date: Fri, 9 May 2025 02:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vitor Soares <ivitro@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Jayesh Choudhary <j-choudhary@ti.com>, ivitro@gmail.com,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
Message-ID: <202505090233.0YCNNAzE-lkp@intel.com>
References: <20250507161800.527464-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507161800.527464-1-ivitro@gmail.com>
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

Hi Vitor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitor-Soares/drm-bridge-cdns-dsi-Replace-deprecated-UNIVERSAL_DEV_PM_OPS/20250508-001902
base:   linus/master
patch link:    https://lore.kernel.org/r/20250507161800.527464-1-ivitro%40gmail.com
patch subject: [PATCH v2] drm/bridge: cdns-dsi: Replace deprecated UNIVERSAL_DEV_PM_OPS()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250509/202505090233.0YCNNAzE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090233.0YCNNAzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090233.0YCNNAzE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c:1148:12: warning: 'cdns_dsi_suspend' defined but not used [-Wunused-function]
    1148 | static int cdns_dsi_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c:1137:12: warning: 'cdns_dsi_resume' defined but not used [-Wunused-function]
    1137 | static int cdns_dsi_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/cdns_dsi_suspend +1148 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c

  1136	
> 1137	static int cdns_dsi_resume(struct device *dev)
  1138	{
  1139		struct cdns_dsi *dsi = dev_get_drvdata(dev);
  1140	
  1141		reset_control_deassert(dsi->dsi_p_rst);
  1142		clk_prepare_enable(dsi->dsi_p_clk);
  1143		clk_prepare_enable(dsi->dsi_sys_clk);
  1144	
  1145		return 0;
  1146	}
  1147	
> 1148	static int cdns_dsi_suspend(struct device *dev)
  1149	{
  1150		struct cdns_dsi *dsi = dev_get_drvdata(dev);
  1151	
  1152		clk_disable_unprepare(dsi->dsi_sys_clk);
  1153		clk_disable_unprepare(dsi->dsi_p_clk);
  1154		reset_control_assert(dsi->dsi_p_rst);
  1155		dsi->link_initialized = false;
  1156		return 0;
  1157	}
  1158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
