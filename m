Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E94CBB0C5
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 16:20:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF80410E44D;
	Sat, 13 Dec 2025 15:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EJFXRYZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652D510E44D
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765639200; x=1797175200;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SfRsyNZlXG5eeLM8ItwniBCiImW1HWheHg8vcn/Omxo=;
 b=EJFXRYZJmEpSyB9vXIZ5ouKMJXCbo4zgOywVXuHXkf8elqdfLzPdPXyx
 zy5QTOo7Ap+jqEkupX2+OPd4mJlefRwMGY4WLqVxuubBaLhd9RB0h3gGO
 TntDcMbgb95si37POsSbOr8hs+3U0/SLYKTSaGkPEzrP8t4/VAXem/g8O
 fujJjjmiIl9NV+q1eDdLrZzIFLujRNzxPo57t4gpqgtuv5UkBST6dT6k2
 MHrAHvHiR1rwfll6RMQ02FKWijylMDwEGiyheTJF4ySkdCWgi33Y8Vtds
 xFyEY4BevpKJLIfCoJbh0kFOEXbkzcuGn7MxBhJY5IwnJ1sYsqVPbsdRn g==;
X-CSE-ConnectionGUID: ZkbMnOL6SnW8VYHTPwEYYA==
X-CSE-MsgGUID: IOJJBFI5TcKk7mtHL+cJCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67490531"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; d="scan'208";a="67490531"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2025 07:20:00 -0800
X-CSE-ConnectionGUID: z0Y2RG6kQ2uPXLwf/ZjKXw==
X-CSE-MsgGUID: Yp1UjaFaR1KDmEwIYcyCqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; d="scan'208";a="197325290"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 07:19:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vURPS-000000007nN-3CMB;
 Sat, 13 Dec 2025 15:19:50 +0000
Date: Sat, 13 Dec 2025 23:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ramiro Oliveira <ramiro.oliveira@advantech.com>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Andi Shyti <andi.shyti@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Wenkai Chung <wenkai.chung@advantech.com.tw>,
 Francisco Aragon-Trivino <francisco.aragon-trivino@advantech.com>,
 Hongzhi Wang <hongzhi.wang@advantech.com>,
 Mikhail Tsukerman <mikhail.tsukerman@advantech.com>,
 Thomas Kastner <thomas.kastner@advantech.com>,
 Ramiro Oliveira <ramiro.oliveira@advantech.com>
Subject: Re: [PATCH 1/8] Add Advantech EIO MFD driver
Message-ID: <202512132239.HrAPSw6z-lkp@intel.com>
References: <20251212-upstream-v1-v1-1-d50d40ec8d8a@advantech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-upstream-v1-v1-1-d50d40ec8d8a@advantech.com>
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

Hi Ramiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9771d0dbe18dd643760431870a6abf9b0866bb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramiro-Oliveira/Add-Advantech-EIO-MFD-driver/20251213-004905
base:   d9771d0dbe18dd643760431870a6abf9b0866bb0
patch link:    https://lore.kernel.org/r/20251212-upstream-v1-v1-1-d50d40ec8d8a%40advantech.com
patch subject: [PATCH 1/8] Add Advantech EIO MFD driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512132239.HrAPSw6z-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132239.HrAPSw6z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132239.HrAPSw6z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/mfd/eio_core.c:37 cannot understand function prototype: 'uint timeout = DEFAULT_TIMEOUT;'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
