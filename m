Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA23EB156C0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 02:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35D10E0DF;
	Wed, 30 Jul 2025 00:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tybz5EJx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFEB10E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 00:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753836708; x=1785372708;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PRvj7/tY0gbPjZ9nvQIa9jtFtzC+d4gO88MH1ziiZgY=;
 b=Tybz5EJxBbZ7VnH7jLO89wQiSur4un6C4Qg4VyTI5Pi6fhn93SlUVEof
 qGnKo/FxXxEYGvOxgOzBdDOEbkPqGQQYn4uYEC8wrhsPKqX63yna2++hM
 uCjRbKlRh1PZ4zh4IiAivQ7bBZ7XSnRZkZMWD0fKlSATK7mpDiDDGmPlC
 Cgu/f1V8alNo+cQJY0XxSJXsz1RiNFPfiBhjqE2RiuFSL6Lt1dLARMT/A
 wqZL9MGt0lSya/luAuSTsrLCcf07/zyjpPfulCbmObcT+i7hVz9xtT3g/
 vNF54GOK2pQQgDIqG7OuYlduzAYII8wZ255dBaVlvGroyH43SEhb/qVyx Q==;
X-CSE-ConnectionGUID: yicRKMcgRnaMVXNdcxzlsg==
X-CSE-MsgGUID: HKSZ9dOPRKCLtEEoXObnww==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="67566239"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67566239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 17:51:47 -0700
X-CSE-ConnectionGUID: 1Std8N5pSHOU8Hrf9kRN4A==
X-CSE-MsgGUID: tRwCDmk9QRGDzKVmAmsItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193840524"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 29 Jul 2025 17:51:40 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ugv2f-0001oh-2w;
 Wed, 30 Jul 2025 00:51:37 +0000
Date: Wed, 30 Jul 2025 08:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Peter Robinson <pbrobinson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/5] phy: rockchip: phy-rockchip-typec: Add
 typec_mux/typec_switch support
Message-ID: <202507300837.EQJOJgpi-lkp@intel.com>
References: <20250729090032.97-3-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729090032.97-3-kernel@airkyi.com>
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

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20250729]
[also build test ERROR on linus/master v6.16]
[cannot apply to robh/for-next rockchip/for-next krzk/for-next krzk-dt/for-next v6.16 v6.16-rc7 v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-phy-rockchip-rk3399-typec-phy-Support-mode-switch/20250729-170255
base:   next-20250729
patch link:    https://lore.kernel.org/r/20250729090032.97-3-kernel%40airkyi.com
patch subject: [PATCH v3 2/5] phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
config: powerpc-randconfig-002-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300837.EQJOJgpi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300837.EQJOJgpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300837.EQJOJgpi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_connector_oob_hotplug_event" [drivers/phy/rockchip/phy-rockchip-typec.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on [n]: SMP [=y] && (PPC_PSERIES [=n] || PPC_PMAC [=n] || PPC_POWERNV [=n] || FSL_SOC_BOOKE [=n])
   Selected by [y]:
   - PM_SLEEP_SMP [=y] && SMP [=y] && (ARCH_SUSPEND_POSSIBLE [=n] || ARCH_HIBERNATION_POSSIBLE [=y]) && PM_SLEEP [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
