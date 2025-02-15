Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F489A36BC2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 04:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1120F10E133;
	Sat, 15 Feb 2025 03:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+K0yiMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6A210E133
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 03:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739591398; x=1771127398;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s83hpw53e7PRszxOc+ixp9OsM9uMRKfBu36IBL06Ix8=;
 b=Q+K0yiMYkIp0KHUG7zqeWHJ6oZ/rI2fofNxi8WTijHrnWvmOVQvER+QY
 mYqc76NNFJ8BCz4UGVvL9wAbhmo/iaDeNVH0SpVROKdIc7+exZAbwYfHF
 F7UtD5vXi//W+zoNEK20KF/79Ea9lWoGhxLHbSaVvOruah0Dudl+j8tDj
 0GupLfm4tAlp7ZZs4Hi7t0oeFxU44zYgJyioR2R5pQxV6Rcc4qsO4hjZh
 ZSdwZYtE9LFVY5iiQ3XzRBpCsi/i7TnM6Gj7IFcvfBxui6ZhIBiPqZIZg
 cRhP9tXHpu4AKSLWQlFL5ohAh1b2GYXH/p8nss9/QQOeug4h1W2rnAkKw A==;
X-CSE-ConnectionGUID: djswjv/STIydsKkjQwQPUw==
X-CSE-MsgGUID: oS+eVtHSRRmV/3Ba+Q4zVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40381596"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="40381596"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 19:49:57 -0800
X-CSE-ConnectionGUID: vY93E0+lRGamjAkQEenMTg==
X-CSE-MsgGUID: bwhLBPaWR+O8r3RpvRetIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="113818341"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 19:49:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tj9Be-001ATX-1u;
 Sat, 15 Feb 2025 03:49:50 +0000
Date: Sat, 15 Feb 2025 11:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
Message-ID: <202502151123.DwXjsR05-lkp@intel.com>
References: <20250213135605.157650-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213135605.157650-3-clamor95@gmail.com>
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

Hi Svyatoslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-display-bridge-Document-Solomon-SSD2825/20250213-215821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250213135605.157650-3-clamor95%40gmail.com
patch subject: [PATCH v1 2/2] drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge
config: x86_64-randconfig-077-20250215 (https://download.01.org/0day-ci/archive/20250215/202502151123.DwXjsR05-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151123.DwXjsR05-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151123.DwXjsR05-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `spi_sync_transfer':
>> include/linux/spi/spi.h:1404: undefined reference to `spi_sync'
   ld: vmlinux.o: in function `ssd2825_read_raw':
>> drivers/gpu/drm/bridge/ssd2825.c:241: undefined reference to `spi_sync'
   ld: vmlinux.o: in function `ssd2825_probe':
>> drivers/gpu/drm/bridge/ssd2825.c:664: undefined reference to `spi_setup'
   ld: vmlinux.o: in function `ssd2825_driver_init':
>> drivers/gpu/drm/bridge/ssd2825.c:737: undefined reference to `__spi_register_driver'


vim +1404 include/linux/spi/spi.h

8ae12a0d85987d David Brownell     2006-01-08  1382  
323117ab60156d Geert Uytterhoeven 2016-09-13  1383  /**
323117ab60156d Geert Uytterhoeven 2016-09-13  1384   * spi_sync_transfer - synchronous SPI data transfer
323117ab60156d Geert Uytterhoeven 2016-09-13  1385   * @spi: device with which data will be exchanged
323117ab60156d Geert Uytterhoeven 2016-09-13  1386   * @xfers: An array of spi_transfers
323117ab60156d Geert Uytterhoeven 2016-09-13  1387   * @num_xfers: Number of items in the xfer array
323117ab60156d Geert Uytterhoeven 2016-09-13  1388   * Context: can sleep
323117ab60156d Geert Uytterhoeven 2016-09-13  1389   *
323117ab60156d Geert Uytterhoeven 2016-09-13  1390   * Does a synchronous SPI data transfer of the given spi_transfer array.
323117ab60156d Geert Uytterhoeven 2016-09-13  1391   *
323117ab60156d Geert Uytterhoeven 2016-09-13  1392   * For more specific semantics see spi_sync().
323117ab60156d Geert Uytterhoeven 2016-09-13  1393   *
2ae3de10abfe0b Randy Dunlap       2020-07-15  1394   * Return: zero on success, else a negative error code.
323117ab60156d Geert Uytterhoeven 2016-09-13  1395   */
323117ab60156d Geert Uytterhoeven 2016-09-13  1396  static inline int
323117ab60156d Geert Uytterhoeven 2016-09-13  1397  spi_sync_transfer(struct spi_device *spi, struct spi_transfer *xfers,
323117ab60156d Geert Uytterhoeven 2016-09-13  1398  	unsigned int num_xfers)
323117ab60156d Geert Uytterhoeven 2016-09-13  1399  {
323117ab60156d Geert Uytterhoeven 2016-09-13  1400  	struct spi_message msg;
323117ab60156d Geert Uytterhoeven 2016-09-13  1401  
323117ab60156d Geert Uytterhoeven 2016-09-13  1402  	spi_message_init_with_transfers(&msg, xfers, num_xfers);
323117ab60156d Geert Uytterhoeven 2016-09-13  1403  
323117ab60156d Geert Uytterhoeven 2016-09-13 @1404  	return spi_sync(spi, &msg);
323117ab60156d Geert Uytterhoeven 2016-09-13  1405  }
323117ab60156d Geert Uytterhoeven 2016-09-13  1406  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
