Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5948B291C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 21:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BE311A828;
	Thu, 25 Apr 2024 19:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GdHyMmYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4243911A828
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714074076; x=1745610076;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=eW+nMszNU9tnsOXne8SmPVoEo1Jo72HGcxpnwGphtD8=;
 b=GdHyMmYkzwN2JPLQSHiOutqgjnh5WUVhqObDeBwnIyX7KnDzqTJl1G2S
 uTs/Yn1R5/f6WZQlx0NrdSKDIUetOpuFNqN21b0TBdV+Q0TIo8g8/rPxg
 W8sGH32Zshu5BMkheZb68YeyVfdKNUcWCNBZC5rWSK23p8d/rbL8ouSjt
 CWK3R0OMBEYfLgX3xM5R08cXzcZEQIFl3yvrdOH2c+WXKtdQadFW7ghRs
 V+Jc64MnK1d23Kq+AXq0oyjulSHismr2yvt9QKRuZBTWIUU64fXeB0ynq
 x75t2xUYNUtyNJGxAgdP6oDPSV2+KtluSxsnZ3R6OrQ44b+D98qStbHNl g==;
X-CSE-ConnectionGUID: kPbYpDsJRh+SJDgjFKVmWA==
X-CSE-MsgGUID: fXrH3uhnTHe4WLkQAgCIGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13575822"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="13575822"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 12:41:16 -0700
X-CSE-ConnectionGUID: jy1Rbf/AQ8aLHqjT7ABvvg==
X-CSE-MsgGUID: AWYQlneZSQucs16NRuChmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208";a="25823526"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 25 Apr 2024 12:41:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1s04xz-0002mu-13;
 Thu, 25 Apr 2024 19:41:11 +0000
Date: Fri, 26 Apr 2024 03:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [drm-misc:for-linux-next 2/2]
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c:366:9: error: implicit
 declaration of function 'seq_printf'; did you mean 'drm_printf'?
Message-ID: <202404260313.KFRxhgYu-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: 9e2b84fb6cd7ee913aa61d461db65c1d6a08dcf2 [2/2] drm/print: drop include seq_file.h
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240426/202404260313.KFRxhgYu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260313.KFRxhgYu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260313.KFRxhgYu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c: In function 'komeda_pipeline_dump_register':
>> drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c:366:9: error: implicit declaration of function 'seq_printf'; did you mean 'drm_printf'? [-Werror=implicit-function-declaration]
     366 |         seq_printf(sf, "\n======== Pipeline-%d ==========\n", pipe->id);
         |         ^~~~~~~~~~
         |         drm_printf
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/arm/display/komeda/d71/d71_component.c: In function 'dump_block_header':
>> drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:94:9: error: implicit declaration of function 'seq_printf'; did you mean 'drm_printf'? [-Werror=implicit-function-declaration]
      94 |         seq_printf(sf, "BLOCK_INFO:\t\t0x%X\n", hdr.block_info);
         |         ^~~~~~~~~~
         |         drm_printf
   drivers/gpu/drm/arm/display/komeda/d71/d71_component.c: In function 'd71_gcu_dump':
>> drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:1360:9: error: implicit declaration of function 'seq_puts' [-Werror=implicit-function-declaration]
    1360 |         seq_puts(sf, "\n------ GCU ------\n");
         |         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +366 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c

7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  358) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  359) void komeda_pipeline_dump_register(struct komeda_pipeline *pipe,
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  360) 				   struct seq_file *sf)
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  361) {
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  362) 	struct komeda_component *c;
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  363) 	u32 id;
a1c3be890440a1 Carsten Haitzler                       2021-02-04  364  	unsigned long avail_comps;
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  365) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22 @366) 	seq_printf(sf, "\n======== Pipeline-%d ==========\n", pipe->id);

:::::: The code at line 366 was first introduced by commit
:::::: 7d3cfb70a604d215e195ba9282df42dd6edff16a drm/komeda: Add debugfs node "register" for register dump

:::::: TO: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
:::::: CC: Liviu Dudau <Liviu.Dudau@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
