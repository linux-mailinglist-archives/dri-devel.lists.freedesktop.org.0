Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908449AF2F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 21:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6B210E3B9;
	Thu, 24 Oct 2024 19:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqZAk51q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3B110E3B9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 19:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729799601; x=1761335601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lvLVXo93a81i5Obbkr1CZRd1nmDpE0nwCV4GyYMJa2o=;
 b=iqZAk51qatbOD2CgdIyBQC2qKGcu9udOvFOMnIY0eC9G3amFJfKOnghU
 e9jsEMnMpjQ/f76c5NmTvbGoE8owjrSOQaTlrUEkyw5PSAiiFs2gtraDp
 ZOkmxde8L16R7xJdiyxY/FJz/OZlne/1HAU5SVtgOu1wwLSz0ZHKvF17Y
 aDbx9Py/OaW4+FBCgDuyvbCPTOXGGHA25F4fIpmwku2Sy9gFf4IL3N2q/
 8DK88oKNtnLyURRhRjt3mDNuEqd/Fg9kHUyw9jdAo5fT06kJ37V1FOF38
 G7tX2f+ztpwb2W15gxCS3SLDcMYmjbD2pNZ4d+NSrRJzb0/SmsKPmmc7G A==;
X-CSE-ConnectionGUID: jLjUiRdZRP21sXesVIWY3A==
X-CSE-MsgGUID: TMlPkiFNRp6SUvPSLyGKVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29356714"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="29356714"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 12:53:21 -0700
X-CSE-ConnectionGUID: isuh4ulTQgeARvpOgzNjiQ==
X-CSE-MsgGUID: bMPHJn2zR6GC2+EYd9gPVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="80874714"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 24 Oct 2024 12:53:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t43tS-000WyC-1M;
 Thu, 24 Oct 2024 19:53:14 +0000
Date: Fri, 25 Oct 2024 03:52:49 +0800
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
Subject: Re: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
Message-ID: <202410250305.UHKDhtxy-lkp@intel.com>
References: <20241022124148.1952761-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022124148.1952761-2-shiyongbang@huawei.com>
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
patch link:    https://lore.kernel.org/r/20241022124148.1952761-2-shiyongbang%40huawei.com
patch subject: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
config: arm64-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250305.UHKDhtxy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250305.UHKDhtxy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `dp_aux_init':
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:154: multiple definition of `dp_aux_init'; drivers/gpu/drm/msm/dp/dp_aux.o:dp_aux.c:(.text+0x8a0): first defined here


vim +154 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c

   152	
   153	void dp_aux_init(struct dp_dev *dp)
 > 154	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
