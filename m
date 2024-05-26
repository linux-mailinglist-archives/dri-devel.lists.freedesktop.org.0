Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7138CF6D3
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 01:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74B410F700;
	Sun, 26 May 2024 23:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7ihNR/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC16A10F713
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 23:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716766461; x=1748302461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YQOuh/heB2ECjajHc+hfb5AhWWtp9iWjRbj78w+1CBs=;
 b=R7ihNR/3+Zyc3PQsihdWDOxbcFe1fvc5Lo8isbCTnnS/xoImMXHGkCQ5
 YIh6BfsnhTcoqjvzrkA/W1b+9KmBFRKf3zO4X6Rp2zm94pAN7vQ838Hpw
 ZoTmPUV9+fdzL+gVN7cHxBGeD6zK9eYr7qtJEbOV2/ax22lDmIPSTb07k
 ggtaf/TcgKlB3TpoOU80F/m+yoxyQkGSGH5nT5ap9qbZAn/5jb7zgZE2U
 A1E7m5ADdvvqY3giUirPYayrcfgG4e+GjyCs1rA/vCC5pCJPSLu/GOele
 l+JU96vO+r3W+iQ0PzbOrDc1ug3QzMrBrByHjOiU+JLHqvQxtUtPenOLk g==;
X-CSE-ConnectionGUID: IlxR8dCMQ/ulXirqw9mvNQ==
X-CSE-MsgGUID: 174gViaXS4e7QhgfPVHwiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="35585950"
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="35585950"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2024 16:34:21 -0700
X-CSE-ConnectionGUID: 8PV7+unKQ12ZKoBXrzU2mg==
X-CSE-MsgGUID: rKWAxDmSRmiheDPISxCmAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,191,1712646000"; d="scan'208";a="39547247"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 26 May 2024 16:34:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sBNNW-0008qr-2t;
 Sun, 26 May 2024 23:34:15 +0000
Date: Mon, 27 May 2024 07:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v6 02/10] drm/bridge: Set firmware node of drm_bridge
 instances automatically
Message-ID: <202405270622.VDMbp9FR-lkp@intel.com>
References: <20240526202115.129049-3-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526202115.129049-3-sui.jingfeng@linux.dev>
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

Hi Sui,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.10-rc1 next-20240523]
[cannot apply to shawnguo/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-bridge-Allow-using-fwnode-APIs-to-get-the-next-bridge/20240527-042402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20240526202115.129049-3-sui.jingfeng%40linux.dev
patch subject: [PATCH v6 02/10] drm/bridge: Set firmware node of drm_bridge instances automatically
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240527/202405270622.VDMbp9FR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405270622.VDMbp9FR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405270622.VDMbp9FR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/dss/hdmi5.c:487:49: error: expected identifier
           drm_bridge_add(&hdmi->bridge, &hdmi->pdev->dev.);
                                                          ^
   1 error generated.


vim +487 drivers/gpu/drm/omapdrm/dss/hdmi5.c

   480	
   481	static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
   482	{
   483		hdmi->bridge.funcs = &hdmi5_bridge_funcs;
   484		hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
   485		hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
   486	
 > 487		drm_bridge_add(&hdmi->bridge, &hdmi->pdev->dev.);
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
