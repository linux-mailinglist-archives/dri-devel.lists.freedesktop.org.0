Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB9ADA18F
	for <lists+dri-devel@lfdr.de>; Sun, 15 Jun 2025 12:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DA910E21C;
	Sun, 15 Jun 2025 10:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQNtF6Lt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649DE10E21C
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Jun 2025 10:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749984774; x=1781520774;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ejtojejYEkKUTk6N+o9TY6ArccN85B9ukz5YklvHMeQ=;
 b=XQNtF6LtFh8fEoq1xk+ckV/CgdECZJHaKVo+byw+jHG13NFzmolz3VxF
 jAD5MxhvQesQW8zJRFjRGn3BVUL1QbnIycILLlbYvMkQBgjQxKMTOE1TL
 QWKK154ynefXwu7srUOpAP6zCF97GcisHOO2PSlbnsdYvXVQRfTmf6lML
 24Ovdb/R+/geXgT6EDDWNbZDQwG3QDqxhZruva7nnRP0fCWqLJi+nvg4I
 q7s9sfxYsob6X+o0TLWDgLitbP4b1aq+WIeGYmSIncyOoVnerTAuI4O2n
 xrIq6m0l1IwAjvj5sD5pr8foc+tbye90FLHQtYgk6ethmOuxE1b8KA+Fh Q==;
X-CSE-ConnectionGUID: iWVHbv1jSJWWo2Nz0Jf+kA==
X-CSE-MsgGUID: lHtSrFg5STi99CIR4Jgs5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52285348"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="52285348"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 03:52:50 -0700
X-CSE-ConnectionGUID: iPnqe7lDTyWwtmi51DmowQ==
X-CSE-MsgGUID: KOTMKZ52R2ij4S+CeEoraw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; d="scan'208";a="149129847"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
 by fmviesa009.fm.intel.com with ESMTP; 15 Jun 2025 03:52:45 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uQkyg-000EFw-0j;
 Sun, 15 Jun 2025 10:52:42 +0000
Date: Sun, 15 Jun 2025 18:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
Message-ID: <202506151839.IKkZs0Z0-lkp@intel.com>
References: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614-apr_14_for_sending-v4-8-8e3945c819cd@samsung.com>
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

Hi Michal,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4774cfe3543abb8ee98089f535e28ebfd45b975a]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Wilczynski/power-sequencing-Add-T-HEAD-TH1520-GPU-power-sequencer-driver/20250615-021142
base:   4774cfe3543abb8ee98089f535e28ebfd45b975a
patch link:    https://lore.kernel.org/r/20250614-apr_14_for_sending-v4-8-8e3945c819cd%40samsung.com
patch subject: [PATCH v4 8/8] drm/imagination: Enable PowerVR driver for RISC-V
config: riscv-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_POWERVR-0-0 (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250615/202506151839.IKkZs0Z0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151839.IKkZs0Z0-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_POWERVR
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_POWERVR [=y] && HAS_IOMEM [=y] && (ARM64 || RISCV [=y]) && DRM [=y] && PM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
