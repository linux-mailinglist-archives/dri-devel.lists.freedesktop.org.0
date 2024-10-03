Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF598F6EF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 21:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB1310E8F1;
	Thu,  3 Oct 2024 19:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="El282CrN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ECD10E90A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727983192; x=1759519192;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qp+B/Cgeqc+O6iNL2JkS/1KXeE+pOf/uQGoDfUIrv2g=;
 b=El282CrN92wsPv0k7Zz7Z5alxAd5mnUESo4o+hnWg5sIh0v2sGvLd+Qs
 7bL/rL72sLUykniFOWE9UYOpa1g1xM2761wjzC/qep4+a/I4FNvDWexqt
 6Bb4Qf6z28fXX6TevUjJ2lLh2C+I8l1ihapTNnOgmA2O5zx42hkIRWyFu
 drUxnS0ron1fyRHPF0sEoQ3UBbU6lRlgtG7kBmjSfACp7ftExEALEudDb
 GTlGlHm02kTT6a6M9M4L2O3S+zeCsKsNd2f7HXVsB8Ci0G5Tl5SmMFgkq
 sGBKbbKS/igwzt2Hy0veuG46qosXVTeilMmY2zv0rjDzkYj+M+V7ib9HG w==;
X-CSE-ConnectionGUID: Nfuyn6SdT7uMUBEi/snCFA==
X-CSE-MsgGUID: 45NpZHhmRtq+v6sC76pR8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52603345"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="52603345"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 12:19:51 -0700
X-CSE-ConnectionGUID: zDzhdysGRxedHv6dEHrW7w==
X-CSE-MsgGUID: eCwOPx0+R+WGR2ssXhKAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74773372"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 03 Oct 2024 12:19:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1swRMX-0000p8-0m;
 Thu, 03 Oct 2024 19:19:45 +0000
Date: Fri, 4 Oct 2024 03:19:33 +0800
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
Subject: Re: [PATCH drm-dp 3/4] drm/hisilicon/hibmc: add dp kapi moduel in
 hibmc drivers
Message-ID: <202410040328.VeVxM9yB-lkp@intel.com>
References: <20240930100610.782363-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930100610.782363-4-shiyongbang@huawei.com>
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
patch link:    https://lore.kernel.org/r/20240930100610.782363-4-shiyongbang%40huawei.com
patch subject: [PATCH drm-dp 3/4] drm/hisilicon/hibmc: add dp kapi moduel in hibmc drivers
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410040328.VeVxM9yB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040328.VeVxM9yB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.o: in function `hibmc_dp_link_cfg':
>> dp_kapi.c:(.text+0x233): undefined reference to `__udivdi3'
>> ld: dp_kapi.c:(.text+0x35a): undefined reference to `__udivdi3'
   ld: dp_kapi.c:(.text+0x3cd): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
