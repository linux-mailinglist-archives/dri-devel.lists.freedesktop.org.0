Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDAB20073
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB5E10E385;
	Mon, 11 Aug 2025 07:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhqP9nxs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C383610E385
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 07:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754897897; x=1786433897;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3JpJ6Jalyc/Z75TZtTL2bSln3Lv3ACasAx22cTuSofY=;
 b=NhqP9nxs5IoeqdaZXazY2r9SwjjF47bGuoV8Ji0a2/iiixLQsyZTEh0m
 ZSM7q/rFVX8bc47Sz5+zgGmpFcNnCbCSWueVQ2FCdC2vbuHNtA7sq3ZWC
 UkwpWgyimzd4Sr/N0SAMA6646kr3ZVeMwMjCiAZQ7aCDibm/ac1o0Xs9m
 Bt7dZWxY60W5EEjHV6vMoi/Q8Zm4FpDcPYGrHkoAQcmIBgp9vOZSPCeoD
 wd5auEZ6RRI5LFbETiBJ6dEBNatv1ncGu5NpwHWO1AW3zFRRqrqnBngPU
 KDC6wq7SIKkyFQL4ms7xAjiXUkDljhAuECEJw26unPKxbsOdQP9F3KnGj A==;
X-CSE-ConnectionGUID: iIBiOtLCRuqjHSBbqRWbEw==
X-CSE-MsgGUID: OskdlJWyReaMuQz7qpb6lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56174421"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56174421"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 00:38:16 -0700
X-CSE-ConnectionGUID: zvVXOCzmRUWLs8w+p1Ksyg==
X-CSE-MsgGUID: o3W9HkPuSKiKNQUtk/wF6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="170285304"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 11 Aug 2025 00:38:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ulN6W-0005dU-37;
 Mon, 11 Aug 2025 07:38:10 +0000
Date: Mon, 11 Aug 2025 15:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul Kumar <rk0006818@gmail.com>, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, rk0006818@gmail.com
Subject: Re: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_*
 with drm_device parameter
Message-ID: <202508111503.saEElm01-lkp@intel.com>
References: <20250811054459.15851-1-rk0006818@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811054459.15851-1-rk0006818@gmail.com>
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

Hi Rahul,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.17-rc1 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rahul-Kumar/drm-komeda-Convert-logging-in-komeda_crtc-c-to-drm_-with-drm_device-parameter/20250811-134646
base:   linus/master
patch link:    https://lore.kernel.org/r/20250811054459.15851-1-rk0006818%40gmail.com
patch subject: [PATCH] drm/komeda: Convert logging in komeda_crtc.c to drm_* with drm_device parameter
config: riscv-randconfig-001-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111503.saEElm01-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111503.saEElm01-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111503.saEElm01-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/arm/display/komeda/komeda_crtc.c: In function 'komeda_attach_bridge':
>> drivers/gpu/drm/arm/display/komeda/komeda_crtc.c:619:37: error: 'struct komeda_dev' has no member named 'drm'
     struct drm_device *drm = pipe->mdev->drm;
                                        ^~


vim +619 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c

   615	
   616	static int komeda_attach_bridge(struct komeda_pipeline *pipe,
   617					struct drm_encoder *encoder)
   618	{
 > 619		struct drm_device *drm = pipe->mdev->drm;
   620		struct device *dev = drm->dev;
   621		struct drm_bridge *bridge;
   622		int err;
   623	
   624		bridge = devm_drm_of_get_bridge(dev, pipe->of_node,
   625						KOMEDA_OF_PORT_OUTPUT, 0);
   626		if (IS_ERR(bridge))
   627			return dev_err_probe(dev, PTR_ERR(bridge), "remote bridge not found for pipe: %s\n",
   628					     of_node_full_name(pipe->of_node));
   629	
   630		err = drm_bridge_attach(encoder, bridge, NULL, 0);
   631		if (err)
   632			drm_err(drm, "bridge_attach() failed for pipe: %s\n",
   633				of_node_full_name(pipe->of_node));
   634	
   635		return err;
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
