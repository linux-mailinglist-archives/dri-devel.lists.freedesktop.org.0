Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA48A40CD4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 06:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A85D10E039;
	Sun, 23 Feb 2025 05:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBWYKfoX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0253A10E039
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 05:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740288471; x=1771824471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZoFMidOYBshnEsnzIKH5pW7glP8uk+guezRItblF2Ys=;
 b=LBWYKfoXVMpzMj1PvUDu/ZjzsWz7ArWAK4bn77OVqSXsWh5X50K0kHH9
 qP/PRsIZ32XTqbTlCwzKlmAjKISUWWkbWqgrvg0PVaQgVbX/NCUsV3jGS
 Ri3bd57ZB/6zu2RZh/P+pEcsONRlWFa40DCFxh06CiJSQ0g6sxcTG1lKp
 BHONeahDi7Eeee6CSeGEalV43HGk5bEj/TEdPecjx6xZnw5xDXXMzWLVN
 mQljWsXNBiC1mnf9xFs/2PPKl7Sn9VBzU7UyFeGEszRN9wKs0zaC0+0ny
 2EVgxJDI2UY+ZSEaG8S4ge//xbkbo3mhqZ/lnuUdBH3wU/Fd+MceVitTs g==;
X-CSE-ConnectionGUID: twNeIWeaRlGAgCk5z+97dw==
X-CSE-MsgGUID: 5t44gvKlQg2IfJ/hu+bvSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52494660"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="52494660"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2025 21:27:49 -0800
X-CSE-ConnectionGUID: MDi6dxZtSu61rtEuamNdDw==
X-CSE-MsgGUID: 5Ce2PjiPSwG7ocpbQD3+mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; d="scan'208";a="116261630"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
 by fmviesa010.fm.intel.com with ESMTP; 22 Feb 2025 21:27:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tm4Wl-00079L-0b;
 Sun, 23 Feb 2025 05:27:43 +0000
Date: Sun, 23 Feb 2025 13:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 liangjian010@huawei.com, chenjianmin@huawei.com,
 lidongming5@huawei.com, shiyongbang@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug
 detect of irq feature
Message-ID: <202502231304.BCzV4Y8D-lkp@intel.com>
References: <20250222025102.1519798-8-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222025102.1519798-8-shiyongbang@huawei.com>
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

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-Restructuring-the-header-dp_reg-h/20250222-110052
base:   linus/master
patch link:    https://lore.kernel.org/r/20250222025102.1519798-8-shiyongbang%40huawei.com
patch subject: [PATCH v3 drm-dp 7/8] drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
config: arm64-randconfig-004-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231304.BCzV4Y8D-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231304.BCzV4Y8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231304.BCzV4Y8D-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "drm_client_init" [drivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko] undefined!
>> ERROR: modpost: "drm_client_register" [drivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko] undefined!
>> ERROR: modpost: "drm_client_release" [drivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
