Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388AA9702AB
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2024 16:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B60610E1BF;
	Sat,  7 Sep 2024 14:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/oDijZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D0810E1BF
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2024 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725718730; x=1757254730;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uQozhLm+pbFrr6L5tufICCo/nQRXjrrcKZfepPqZQLo=;
 b=B/oDijZgcVurazcfYZMS0/VReylQx4UUia5sVIHutkuMB/9f//7dm72n
 Xux1fe681rD0H6wz5rAWyTOJNm/+PwmW4dduTNp5cvxwB9IYFbcxWKIrA
 CeDKN/ySFFjwa6G4LEBaNk4HU+fds4RHQ5nBzK2CG4iMOOhARKvQeQKdZ
 XOkvEVxPY53kLjgiMlDVZLRxU7bVzlmPwIRgEM/O1ITDABrnI5PKbW+RN
 mCL3XJV9Gl3pdo6gfJ9ojvqteWvFrUv4WfGaxoGdTtrAJkAgVQ/IOMwej
 8QkeVOWDvW0uL3Z/Ny9bkdUY32nJhzAobVVc0uypU7W+46RPcIlULzh+A g==;
X-CSE-ConnectionGUID: 2dkN2EgvSaye8pmJ6E5oAw==
X-CSE-MsgGUID: Qj7xF62uT5KnwasaZNlyvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24574795"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="24574795"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2024 07:18:49 -0700
X-CSE-ConnectionGUID: 48cMxYdJQreK9c9y+2SI+A==
X-CSE-MsgGUID: K0vScEDdR6aWxEC9TKewVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; d="scan'208";a="66949831"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 07 Sep 2024 07:18:45 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1smwGx-000Ccn-15;
 Sat, 07 Sep 2024 14:18:43 +0000
Date: Sat, 7 Sep 2024 22:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
Message-ID: <202409072155.3p25ZqJu-lkp@intel.com>
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
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

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240905]
[cannot apply to v6.11-rc6 v6.11-rc5 v6.11-rc4 linus/master v6.11-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/drm-imx-Add-missing-DRM_BRIDGE_CONNECTOR-dependency/20240906-144116
base:   next-20240905
patch link:    https://lore.kernel.org/r/20240906063857.2223442-1-alexander.stein%40ew.tq-group.com
patch subject: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
config: alpha-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_IMX_PARALLEL_DISPLAY-0-0 (https://download.01.org/0day-ci/archive/20240907/202409072155.3p25ZqJu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240907/202409072155.3p25ZqJu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409072155.3p25ZqJu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_IMX_PARALLEL_DISPLAY
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
