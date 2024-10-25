Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1F99AF73A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 04:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0C410E0CF;
	Fri, 25 Oct 2024 02:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I+QhADaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6767E10E0CF
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 02:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729822061; x=1761358061;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eDa0JoCTkZ7sT5p8NIJ1IUizt1fk8CCVwX2LEkWEMls=;
 b=I+QhADaB50YuFCmXfrm+qow6TEjYnSe76tvXxi423ca4U2Hx/zKIrE9B
 g6hgi79Un/PD/d+cSXkWSGsm0dQMnhRJ+hgUv/3zqWTazg8QkhhNEGBlT
 s+015hGIp2HC4HsR6JtR+vVSfdaON/+qfCHQYKGTNI8eNuzs/3kci7O/W
 gbkiubIG/D00XBgX3aQkfpIMBS0rbQHWZDY9YHATl2AOVO9vAruFS9GgK
 YvsTtCKiaECrqB18lu0hCtqIsmgEQ3wJlCLitKvLLm2nyeX6ibWZNaqer
 SUqCyxbQl2UlGybqnnQ3FVmoCbdBLja2Vybw1A2vZwNYAPbE+WbGWYD7j g==;
X-CSE-ConnectionGUID: xRGkTZOaT5q1hLfBBEad/w==
X-CSE-MsgGUID: xOaCCr2CS4eHBF2S6zqRDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54885117"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="54885117"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 19:07:40 -0700
X-CSE-ConnectionGUID: J77VyAOeRp6effboy0MFbQ==
X-CSE-MsgGUID: 2cdvWipwRfyICN8D7KYDwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="85328157"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2024 19:07:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t49jf-000XPQ-1t;
 Fri, 25 Oct 2024 02:07:31 +0000
Date: Fri, 25 Oct 2024 10:07:18 +0800
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
Subject: Re: [PATCH V2 drm-dp 3/4] drm/hisilicon/hibmc: add dp hw moduel in
 hibmc
Message-ID: <202410250931.UDQ9s66H-lkp@intel.com>
References: <20241022124148.1952761-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022124148.1952761-4-shiyongbang@huawei.com>
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
patch link:    https://lore.kernel.org/r/20241022124148.1952761-4-shiyongbang%40huawei.com
patch subject: [PATCH V2 drm-dp 3/4] drm/hisilicon/hibmc: add dp hw moduel in hibmc
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241025/202410250931.UDQ9s66H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250931.UDQ9s66H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/imx/imx-legacy-bridge.o
>> ERROR: modpost: "__divdi3" [drivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/hisilicon/hibmc/hibmc-drm.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
