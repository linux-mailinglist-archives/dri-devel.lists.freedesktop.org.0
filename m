Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E64906A7E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 12:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBB310EA23;
	Thu, 13 Jun 2024 10:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGMXyFPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C3B10EA23
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 10:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718276158; x=1749812158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6b8ovoJTtpRLHBC4ajzYK05o5vyr6KBXY3vrPVEqJ8Q=;
 b=SGMXyFPmJnNpYSkYA1J9tKyEGKemxDrRKFSOyqzro8c2J8M7sqFe/JBq
 RCStm4CPi5aV2UFR4gOYgBGxk/hZ+QQ0DwAnSUtaQKNLxyAFU8+/xpyFV
 XEJtMLHK6qfrj2sKGP18wCfuKM2wOhorrn25NDO/C7Thl6tZe+68/ZXtR
 dXmBHrn7T0spguw6UB6kJI2PTgcPDb/C723COO3LHPuzoPtKcu7SwKKfZ
 9tU9fwShOkapw41iJAkj2vXQD6rjyuyUeMX0zFHuS13X94ND64lNRANXF
 9hCFWiEA0rybbDLW4AQlwWxpDJLtVscC30WCQhdiqRES3SCNI3uoWExcy A==;
X-CSE-ConnectionGUID: vYiLsVxdSDCIMoBuRSaToQ==
X-CSE-MsgGUID: qply2tYxSJSS9bX/EPlvXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="37606709"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="37606709"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:55:58 -0700
X-CSE-ConnectionGUID: tnrO+fJUQeGyx0/k0IZjWg==
X-CSE-MsgGUID: bKS/wAsASY+1gpvGdJC2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="45228251"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 13 Jun 2024 03:55:51 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sHi7R-0002WE-0F;
 Thu, 13 Jun 2024 10:55:49 +0000
Date: Thu, 13 Jun 2024 18:55:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
Message-ID: <202406131802.9chtX0Ci-lkp@intel.com>
References: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-6-060e48eea250@tomeuvizoso.net>
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

Hi Tomeu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 83a7eefedc9b56fe7bfeff13b6c7356688ffa670]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/iommu-rockchip-Add-compatible-for-rockchip-rk3588-iommu/20240612-215814
base:   83a7eefedc9b56fe7bfeff13b6c7356688ffa670
patch link:    https://lore.kernel.org/r/20240612-6-10-rocket-v1-6-060e48eea250%40tomeuvizoso.net
patch subject: [PATCH 6/9] accel/rocket: Add a new driver for Rockchip's NPU
config: arc-kismet-CONFIG_IOMMU_IO_PGTABLE_LPAE-CONFIG_DRM_ACCEL_ROCKET-0-0 (https://download.01.org/0day-ci/archive/20240613/202406131802.9chtX0Ci-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240613/202406131802.9chtX0Ci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406131802.9chtX0Ci-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE when selected by DRM_ACCEL_ROCKET
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
     Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=y]
     Selected by [y]:
     - DRM_ACCEL_ROCKET [=y] && DRM [=y] && (ARM64 || COMPILE_TEST [=y]) && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
