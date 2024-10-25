Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64699AF82F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 05:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB6F10E9EA;
	Fri, 25 Oct 2024 03:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRw/8DNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324510E9EA
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 03:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729827104; x=1761363104;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yKWhaHoKwMvKgUCvzoCF4HnRBfeVm1f1O/hBJcEF5YI=;
 b=jRw/8DNneGIYWmiXGj/cBSixqme+E1u6acjjF8LI4Ri3hrGarDa0YOzd
 RuXOIUMUKdZlxoXbbT9lWll/exIJP0NQBZ+30qTb6iJreYIqQVg+aRUDp
 z6t/byP9toAMHSeKYBhFSz8rWpsJLkLdG20cps9YNCF6C/RgMWOcWJL1y
 KCQFOGunsfBIne9drYiI/zncm3eo7xYqrADt2c3wjHtITCHL9398LkfY/
 maSsSkzYW5jeVJ3P1v0zlLqzBn+m+mkZETSSz6jCJ+utYtfCzkRatHyEG
 7WLeCD2GWeqBaW/Y2nURWthn/LoylYm2tPL0vvk/0rRAfdEA+1VlfnuFL A==;
X-CSE-ConnectionGUID: iTqeviFWSLGgA2pSLkQmCw==
X-CSE-MsgGUID: VjwJWeOgSR6s4Fn13GKqsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40031849"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40031849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 20:31:43 -0700
X-CSE-ConnectionGUID: EIGL+UZNTIOmbDWB+69qkQ==
X-CSE-MsgGUID: xYWNKBsnTZeV8O9mUQFEhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="118257848"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 24 Oct 2024 20:31:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4B31-000XXC-3D;
 Fri, 25 Oct 2024 03:31:35 +0000
Date: Fri, 25 Oct 2024 11:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: oe-kbuild-all@lists.linux.dev, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com,
 shiyongbang@huawei.com, libaihan@huawei.com, shenjian15@huawei.com,
 shaojijie@huawei.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 drm-dp 4/4] drm/hisilicon/hibmc: add dp module in hibmc
Message-ID: <202410251136.1m7BlR68-lkp@intel.com>
References: <20241022124148.1952761-5-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022124148.1952761-5-shiyongbang@huawei.com>
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

Hi Yongbang,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-add-dp-aux-in-hibmc/20241022-204925
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241022124148.1952761-5-shiyongbang%40huawei.com
patch subject: [PATCH V2 drm-dp 4/4] drm/hisilicon/hibmc: add dp module in hibmc
config: powerpc-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251136.1m7BlR68-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251136.1m7BlR68-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251136.1m7BlR68-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.o: in function `dp_link_cfg':
>> dp_hw.c:(.text.dp_link_cfg+0x250): undefined reference to `__udivdi3'
>> powerpc-linux-ld: dp_hw.c:(.text.dp_link_cfg+0x340): undefined reference to `__udivdi3'
   powerpc-linux-ld: dp_hw.c:(.text.dp_link_cfg+0x384): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
