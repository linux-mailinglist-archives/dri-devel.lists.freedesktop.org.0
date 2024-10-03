Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D698ECB5
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 12:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F3E10E7DF;
	Thu,  3 Oct 2024 10:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cK5jzg33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A1210E7DF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727950349; x=1759486349;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7kQ9CE+8piCl1PeEPd00/TWkbHX5U5LP/am+07aNRu4=;
 b=cK5jzg33UTniqgKogLAmsjRTRTAGmwunuRFtpsxOIewwHobtTf3XNhRA
 cVClUnyUTq+Nfcz7n4a+wL+DfcS3h3xuN5sy7u3snEnHat4lWWeas6kVA
 TCaH9XJWlDA0/uqbqSa2UgnhW5MqBVnnlGP36uEGNIMiFUgGpvrnBtuxD
 4GmUqu6XkXWP7Yz6tTOMnlNZCzZ1J28+mcQo5xjDgadJuu2ew2wd94oSI
 IWmezKf8t2vDG8daiDBoumFdX9yJC9Krvlrjy2MvgFOGwxlUl6buZ3DiX
 g5MBtGqhxrDmM0ROS5b7LcWfxVUe+5Mo07HH+plG0tmt+Nc2yZPZA2n1H w==;
X-CSE-ConnectionGUID: D6DPXP8aSUqwNvvXP3neDA==
X-CSE-MsgGUID: k3bPBLbcTBe79zo2PxCcrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27316400"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27316400"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 03:12:29 -0700
X-CSE-ConnectionGUID: lbW8fCgmRXSfOkJ8w0Wtpw==
X-CSE-MsgGUID: aeHdcJlWSAiJEvUGTdUcBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="111764103"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 03 Oct 2024 03:12:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1swIon-0000H1-1G;
 Thu, 03 Oct 2024 10:12:21 +0000
Date: Thu, 3 Oct 2024 18:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: shiyongbang <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: oe-kbuild-all@lists.linux.dev, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com,
 shiyongbang@huawei.com, libaihan@huawei.com, shenjian15@huawei.com,
 shaojijie@huawei.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in
 hibmc drivers
Message-ID: <202410031735.8iRZZR6T-lkp@intel.com>
References: <20240930100610.782363-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930100610.782363-3-shiyongbang@huawei.com>
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

Hi shiyongbang,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.12-rc1 next-20241003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shiyongbang/drm-hisilicon-hibmc-add-dp-aux-in-hibmc-drivers/20240930-181437
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240930100610.782363-3-shiyongbang%40huawei.com
patch subject: [PATCH drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
config: i386-buildonly-randconfig-003-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031735.8iRZZR6T-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410031735.8iRZZR6T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:10:
   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c: In function 'dp_link_training_cr_pre':
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h:45:41: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
      45 | #define DPCD_VOLTAGE_SWING_LEVEL_2      FIELD_PREP(GENMASK(1, 0), 2)
         |                                         ^~~~~~~~~~
   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:105:32: note: in expansion of macro 'DPCD_VOLTAGE_SWING_LEVEL_2'
     105 |                 train_set[i] = DPCD_VOLTAGE_SWING_LEVEL_2 | DPCD_PRE_EMPHASIS_LEVEL_0;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +45 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.h

ff6e8ef6021188 baihan li 2024-09-30  37  
ff6e8ef6021188 baihan li 2024-09-30  38  #define DPCD_TRAINING_PATTERN_DISABLE	0x0
ff6e8ef6021188 baihan li 2024-09-30  39  #define DPCD_TRAINING_PATTERN_1		0x1
ff6e8ef6021188 baihan li 2024-09-30  40  #define DPCD_TRAINING_PATTERN_2		0x2
ff6e8ef6021188 baihan li 2024-09-30  41  #define DPCD_TRAINING_PATTERN_3		0x3
ff6e8ef6021188 baihan li 2024-09-30  42  #define DPCD_TRAINING_PATTERN_4		0x7
ff6e8ef6021188 baihan li 2024-09-30  43  #define DPCD_VOLTAGE_SWING_LEVEL_0	FIELD_PREP(GENMASK(1, 0), 0)
ff6e8ef6021188 baihan li 2024-09-30  44  #define DPCD_VOLTAGE_SWING_LEVEL_1	FIELD_PREP(GENMASK(1, 0), 1)
ff6e8ef6021188 baihan li 2024-09-30 @45  #define DPCD_VOLTAGE_SWING_LEVEL_2	FIELD_PREP(GENMASK(1, 0), 2)
ff6e8ef6021188 baihan li 2024-09-30  46  #define DPCD_VOLTAGE_SWING_LEVEL_3	FIELD_PREP(GENMASK(1, 0), 3)
ff6e8ef6021188 baihan li 2024-09-30  47  #define DPCD_PRE_EMPHASIS_LEVEL_0	FIELD_PREP(GENMASK(4, 3), 0)
ff6e8ef6021188 baihan li 2024-09-30  48  #define DPCD_PRE_EMPHASIS_LEVEL_1	FIELD_PREP(GENMASK(4, 3), 1)
ff6e8ef6021188 baihan li 2024-09-30  49  #define DPCD_PRE_EMPHASIS_LEVEL_2	FIELD_PREP(GENMASK(4, 3), 2)
ff6e8ef6021188 baihan li 2024-09-30  50  #define DPCD_PRE_EMPHASIS_LEVEL_3	FIELD_PREP(GENMASK(4, 3), 3)
ff6e8ef6021188 baihan li 2024-09-30  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
