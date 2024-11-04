Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9809BAD0E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 08:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F6A10E217;
	Mon,  4 Nov 2024 07:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqTZ5esY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EA910E217
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730704916; x=1762240916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vVvC//hm2Qb9JX4BN8wiAIzh4mvzc75vswlBe2pSDsk=;
 b=kqTZ5esY93q9TrkOjyuOjs7DmH7vy6KF1QYVGgaYmsZw670GCkNksRoZ
 6r9NglskKCjQ7a9yE/L/57paHOmJOG8qATTp3vedtdpqZWCaubtVxwBsD
 7DA661PxcW3GctPaNjgUdOuzB1i9+fqneXeDY56tpz1zlbx4J/ljDIfDc
 r9LTK49jordZJTeijgCMk7G/uzVecsTuTlm8AsrZ7UobAnaJcgYSYIj9g
 1rUflXPb/F2DQzNU7NH7DX8KcS7ZBhS5rNW8zdTOUSvHWv1OdccMetgkU
 JLgC9W5oV8fHlc+P/hcq64o051szkRaW1U5qt4YyqhEBtGM9U8vDrTgkg A==;
X-CSE-ConnectionGUID: fCS0UAh9RXS9vzk76k0/XQ==
X-CSE-MsgGUID: wV4KkbitTxG1xaZark9rkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="34177763"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="34177763"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 23:21:56 -0800
X-CSE-ConnectionGUID: gOTNyNwWQyioP4BtnfK/IA==
X-CSE-MsgGUID: MZev9TICTqKf9KSMkCwTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="83452794"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 03 Nov 2024 23:21:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t7rPJ-000kal-2E;
 Mon, 04 Nov 2024 07:21:49 +0000
Date: Mon, 4 Nov 2024 15:21:38 +0800
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
Subject: Re: [PATCH V3 drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
Message-ID: <202411041559.WIfxRN6n-lkp@intel.com>
References: <20241101105028.2177274-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101105028.2177274-3-shiyongbang@huawei.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-add-dp-aux-in-hibmc/20241101-185648
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241101105028.2177274-3-shiyongbang%40huawei.com
patch subject: [PATCH V3 drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in hibmc
config: csky-randconfig-r121-20241103 (https://download.01.org/0day-ci/archive/20241104/202411041559.WIfxRN6n-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241104/202411041559.WIfxRN6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:12:10: sparse: sparse: symbol 'link_rate_map' was not declared. Should it be static?

vim +/link_rate_map +12 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c

    11	
  > 12	const u8 link_rate_map[] = {DP_LINK_BW_1_62, DP_LINK_BW_2_7,
    13				    DP_LINK_BW_5_4, DP_LINK_BW_8_1};
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
