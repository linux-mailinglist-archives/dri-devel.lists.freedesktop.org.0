Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE5A8A10E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 16:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABB310E7AF;
	Tue, 15 Apr 2025 14:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/rBq5h7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E2810E7A2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744727239; x=1776263239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z63JfSsHpIErknyiCFjXZ6ek1chC5/7Pr7BECXZasXY=;
 b=K/rBq5h7RfMOiRAsabuhxesCe4YPo2N/91wOeCrQjA45g5xr34pHw/NU
 +QI6eZO1Dx5VKsQTCw2f0Bz8Hnh4oSlE1HyxxXR0RvKZGZf0stSPwL2El
 fOx/h9s+7uV/0GMZoJu2CDcY2CRsG6auGeZ4qOKnvjkRmptj3PCi0A2Pu
 /wehVj/loSVoSwoi41L8pjWhyETixncR30iQzH417DxjpnTGROLHnO3K+
 NplNgmmyGoFGdMn3et8ZbJjLtqMxODuvf1ZV2g35C7JBU2gyZnSPjW9II
 wHlaOiyKIOHoyovqX2bFustW4WoTeGMzGzi2tGZ8gyhmgq7FDvMx1kDjr w==;
X-CSE-ConnectionGUID: jkOvC/eVT+C3du3C+CoOwA==
X-CSE-MsgGUID: MtCou6iNSTaGnF6bOZHkcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45473544"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45473544"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 07:27:16 -0700
X-CSE-ConnectionGUID: sacFQhjARimp6JlLoAQRFw==
X-CSE-MsgGUID: Ay/bqOuZSU2GocGP1WfIkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129909049"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 15 Apr 2025 07:27:12 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1u4hFk-000GHi-2X;
 Tue, 15 Apr 2025 14:27:08 +0000
Date: Tue, 15 Apr 2025 22:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, bliang@analogixsemi.com,
 qwen@analogixsemi.com, treapking@chromium.org,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/bridge:anx7625: Enable DSC feature
Message-ID: <202504152230.BCIdpiru-lkp@intel.com>
References: <20250414100502.1604717-3-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414100502.1604717-3-xji@analogixsemi.com>
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

Hi Xin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc2 next-20250415]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Ji/drm-mipi-dsi-Add-compression-supported-flag-in-drm_mipi_dsi/20250414-181005
base:   linus/master
patch link:    https://lore.kernel.org/r/20250414100502.1604717-3-xji%40analogixsemi.com
patch subject: [PATCH v3 3/3] drm/bridge:anx7625: Enable DSC feature
config: arm64-randconfig-002-20250415 (https://download.01.org/0day-ci/archive/20250415/202504152230.BCIdpiru-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152230.BCIdpiru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504152230.BCIdpiru-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_bridge_mode_set':
>> anx7625.c:(.text+0x28d4): undefined reference to `drm_dsc_set_rc_buf_thresh'
>> aarch64-linux-ld: anx7625.c:(.text+0x28dc): undefined reference to `drm_dsc_set_const_params'
>> aarch64-linux-ld: anx7625.c:(.text+0x28e4): undefined reference to `drm_dsc_initial_scale_value'
>> aarch64-linux-ld: anx7625.c:(.text+0x2900): undefined reference to `drm_dsc_setup_rc_params'
>> aarch64-linux-ld: anx7625.c:(.text+0x290c): undefined reference to `drm_dsc_compute_rc_parameters'
>> aarch64-linux-ld: anx7625.c:(.text+0x2930): undefined reference to `drm_dsc_pps_payload_pack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
