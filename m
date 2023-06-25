Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B5E73D461
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jun 2023 23:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F2910E199;
	Sun, 25 Jun 2023 21:16:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8F810E0C6;
 Sun, 25 Jun 2023 21:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687727758; x=1719263758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rxwPClXI5Fv32K8pZ6viJ0/6vBMwswfGWypiLsKlSxc=;
 b=aLvQOwdpFpCjuTsWwFBIU83n+qyse6jc6dFS4SFlRHz82nME7t1M+Z/O
 Mkqhe5+IAg+5QtxzDGrKP0mieoGaTWuHjTc8WUZUewJyZ8EyOy7EyZfaA
 mCI3WmbA7PzOh2UlHENs43d5q9ccbCfE6GU8p6/nayW/Wg9vVUHjObeSm
 VutZzkvo1/sC3uchShoDP46/VpaMcvvURX0XYANisqz8TGIdv4H+hDP4N
 6tq4Puezdi/pN+wRynJtb+gd0x6LmS9YmQPLPMM6+HVVIsv94hmqf/dDQ
 mBhA+2TTLU5zVuwRWFfxlXbFOMhqCtKlIBcgXA9hgp5997VAI+WyCn/92 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="340707765"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="340707765"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2023 14:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="710025175"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; d="scan'208";a="710025175"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 25 Jun 2023 14:15:52 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qDX5L-000AHh-1l;
 Sun, 25 Jun 2023 21:15:51 +0000
Date: Mon, 26 Jun 2023 05:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Su Hui <suhui@nfschina.com>, alexander.deucher@amd.com,
 airlied@gmail.com, Xinhui.Pan@amd.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
Message-ID: <202306260550.SInEbMd3-lkp@intel.com>
References: <20230620045919.492128-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620045919.492128-1-suhui@nfschina.com>
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
Cc: Su Hui <suhui@nfschina.com>, Jane.Jian@amd.com, Bokun.Zhang@amd.com,
 David.Francis@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 monk.liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Su,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.4-rc7 next-20230623]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Su-Hui/drm-amd-amdgpu-Properly-tune-the-size-of-struct/20230620-130013
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230620045919.492128-1-suhui%40nfschina.com
patch subject: [PATCH] drm/amd/amdgpu: Properly tune the size of struct
config: m68k-randconfig-r093-20230625 (https://download.01.org/0day-ci/archive/20230626/202306260550.SInEbMd3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260550.SInEbMd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306260550.SInEbMd3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:275:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:280:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:281:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:306:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:307:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:308:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:314:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:320:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:75: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:75: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:458:75: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:45: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:487:45: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:498:42: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:70: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:500:70: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:501:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:504:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:505:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:507:35: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:769:35: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1204:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1205:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1206:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1207:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1208:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1209:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1210:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1211:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1212:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1213:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1214:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1216:24: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1240:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1241:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1242:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1243:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c:1245:24: sparse:     got restricted __le32 [usertype]
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:171:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:309:18: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[addressable] cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:29: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c:312:29: sparse:     got void *[addressable] cpu_addr
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:139:32: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:147:21: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:151:26: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:152:30: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:154:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:155:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:161:29: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:162:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:163:34: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:170:28: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:67: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:311:67: sparse:     got void *[assigned] ptr
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:45: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:335:45: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:346:42: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *cpu_addr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:70: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:348:70: sparse:     got void *cpu_addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:349:53: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:352:41: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:353:40: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:355:35: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:583:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:584:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:585:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:586:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:587:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:588:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:589:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:590:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:591:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:592:16: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:593:17: sparse:     got restricted __le32 [usertype]
   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c:594:17: sparse: sparse: too many warnings
--
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:457:25: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *src @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse:     expected void const volatile [noderef] __iomem *src
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:574:59: sparse:     got void *ptr
>> drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *ptr @@
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:623:37: sparse:     got void *ptr
   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c:1081:27: sparse: sparse: symbol 'vce_v4_0_ip_funcs' was not declared. Should it be static?
--
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:65:25: sparse: sparse: cast to restricted __be32
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:74:26: sparse: sparse: cast to restricted __be32
>> drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *dst @@     got void *kaddr @@
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:44: sparse:     expected void volatile [noderef] __iomem *dst
   drivers/gpu/drm/amd/amdgpu/../pm/powerplay/smumgr/smu7_smumgr.c:411:44: sparse:     got void *kaddr

vim +458 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c

d38ceaf99ed015 Alex Deucher         2015-04-20  183  
d38ceaf99ed015 Alex Deucher         2015-04-20  184  int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
d38ceaf99ed015 Alex Deucher         2015-04-20  185  {
d38ceaf99ed015 Alex Deucher         2015-04-20  186  	unsigned long bo_size;
d38ceaf99ed015 Alex Deucher         2015-04-20  187  	const char *fw_name;
d38ceaf99ed015 Alex Deucher         2015-04-20  188  	const struct common_firmware_header *hdr;
f10984a353c87e Srinivasan Shanmugam 2023-05-17  189  	unsigned int family_id;
10dd74eac4dba9 James Zhu            2018-05-15  190  	int i, j, r;
d38ceaf99ed015 Alex Deucher         2015-04-20  191  
5c53d19b76dccb James Zhu            2018-06-18  192  	INIT_DELAYED_WORK(&adev->uvd.idle_work, amdgpu_uvd_idle_work_handler);
d38ceaf99ed015 Alex Deucher         2015-04-20  193  
d38ceaf99ed015 Alex Deucher         2015-04-20  194  	switch (adev->asic_type) {
d1af7ac24fd70f Sonny Jiang          2020-06-10  195  #ifdef CONFIG_DRM_AMDGPU_SI
d1af7ac24fd70f Sonny Jiang          2020-06-10  196  	case CHIP_TAHITI:
d1af7ac24fd70f Sonny Jiang          2020-06-10  197  		fw_name = FIRMWARE_TAHITI;
d1af7ac24fd70f Sonny Jiang          2020-06-10  198  		break;
d1af7ac24fd70f Sonny Jiang          2020-06-10  199  	case CHIP_VERDE:
d1af7ac24fd70f Sonny Jiang          2020-06-10  200  		fw_name = FIRMWARE_VERDE;
d1af7ac24fd70f Sonny Jiang          2020-06-10  201  		break;
d1af7ac24fd70f Sonny Jiang          2020-06-10  202  	case CHIP_PITCAIRN:
d1af7ac24fd70f Sonny Jiang          2020-06-10  203  		fw_name = FIRMWARE_PITCAIRN;
d1af7ac24fd70f Sonny Jiang          2020-06-10  204  		break;
d1af7ac24fd70f Sonny Jiang          2020-06-10  205  	case CHIP_OLAND:
d1af7ac24fd70f Sonny Jiang          2020-06-10  206  		fw_name = FIRMWARE_OLAND;
d1af7ac24fd70f Sonny Jiang          2020-06-10  207  		break;
d1af7ac24fd70f Sonny Jiang          2020-06-10  208  #endif
d38ceaf99ed015 Alex Deucher         2015-04-20  209  #ifdef CONFIG_DRM_AMDGPU_CIK
d38ceaf99ed015 Alex Deucher         2015-04-20  210  	case CHIP_BONAIRE:
d38ceaf99ed015 Alex Deucher         2015-04-20  211  		fw_name = FIRMWARE_BONAIRE;
d38ceaf99ed015 Alex Deucher         2015-04-20  212  		break;
d38ceaf99ed015 Alex Deucher         2015-04-20  213  	case CHIP_KABINI:
d38ceaf99ed015 Alex Deucher         2015-04-20  214  		fw_name = FIRMWARE_KABINI;
d38ceaf99ed015 Alex Deucher         2015-04-20  215  		break;
d38ceaf99ed015 Alex Deucher         2015-04-20  216  	case CHIP_KAVERI:
d38ceaf99ed015 Alex Deucher         2015-04-20  217  		fw_name = FIRMWARE_KAVERI;
d38ceaf99ed015 Alex Deucher         2015-04-20  218  		break;
d38ceaf99ed015 Alex Deucher         2015-04-20  219  	case CHIP_HAWAII:
d38ceaf99ed015 Alex Deucher         2015-04-20  220  		fw_name = FIRMWARE_HAWAII;
d38ceaf99ed015 Alex Deucher         2015-04-20  221  		break;
d38ceaf99ed015 Alex Deucher         2015-04-20  222  	case CHIP_MULLINS:
d38ceaf99ed015 Alex Deucher         2015-04-20  223  		fw_name = FIRMWARE_MULLINS;
d38ceaf99ed015 Alex Deucher         2015-04-20  224  		break;
d38ceaf99ed015 Alex Deucher         2015-04-20  225  #endif
d38ceaf99ed015 Alex Deucher         2015-04-20  226  	case CHIP_TONGA:
d38ceaf99ed015 Alex Deucher         2015-04-20  227  		fw_name = FIRMWARE_TONGA;
d38ceaf99ed015 Alex Deucher         2015-04-20  228  		break;
974ee3db0ff88e David Zhang          2015-07-08  229  	case CHIP_FIJI:
974ee3db0ff88e David Zhang          2015-07-08  230  		fw_name = FIRMWARE_FIJI;
974ee3db0ff88e David Zhang          2015-07-08  231  		break;
d38ceaf99ed015 Alex Deucher         2015-04-20  232  	case CHIP_CARRIZO:
d38ceaf99ed015 Alex Deucher         2015-04-20  233  		fw_name = FIRMWARE_CARRIZO;
d38ceaf99ed015 Alex Deucher         2015-04-20  234  		break;
a39c8cea3512bd Samuel Li            2015-10-08  235  	case CHIP_STONEY:
a39c8cea3512bd Samuel Li            2015-10-08  236  		fw_name = FIRMWARE_STONEY;
a39c8cea3512bd Samuel Li            2015-10-08  237  		break;
2cc0c0b5cd4d07 Flora Cui            2016-03-14  238  	case CHIP_POLARIS10:
2cc0c0b5cd4d07 Flora Cui            2016-03-14  239  		fw_name = FIRMWARE_POLARIS10;
38d75817649508 Sonny Jiang          2015-11-05  240  		break;
2cc0c0b5cd4d07 Flora Cui            2016-03-14  241  	case CHIP_POLARIS11:
2cc0c0b5cd4d07 Flora Cui            2016-03-14  242  		fw_name = FIRMWARE_POLARIS11;
c4642a479fac9f Junwei Zhang         2016-12-14  243  		break;
2327e6261ab2bc Alex Deucher         2017-09-01  244  	case CHIP_POLARIS12:
2327e6261ab2bc Alex Deucher         2017-09-01  245  		fw_name = FIRMWARE_POLARIS12;
2327e6261ab2bc Alex Deucher         2017-09-01  246  		break;
09bfb8912dc163 Leo Liu              2017-03-03  247  	case CHIP_VEGA10:
09bfb8912dc163 Leo Liu              2017-03-03  248  		fw_name = FIRMWARE_VEGA10;
09bfb8912dc163 Leo Liu              2017-03-03  249  		break;
2327e6261ab2bc Alex Deucher         2017-09-01  250  	case CHIP_VEGA12:
2327e6261ab2bc Alex Deucher         2017-09-01  251  		fw_name = FIRMWARE_VEGA12;
38d75817649508 Sonny Jiang          2015-11-05  252  		break;
ba8f7ad0e5b258 Leo Liu              2017-11-10  253  	case CHIP_VEGAM:
ba8f7ad0e5b258 Leo Liu              2017-11-10  254  		fw_name = FIRMWARE_VEGAM;
ba8f7ad0e5b258 Leo Liu              2017-11-10  255  		break;
cac18c82e0c5b3 Feifei Xu            2018-05-11  256  	case CHIP_VEGA20:
cac18c82e0c5b3 Feifei Xu            2018-05-11  257  		fw_name = FIRMWARE_VEGA20;
cac18c82e0c5b3 Feifei Xu            2018-05-11  258  		break;
d38ceaf99ed015 Alex Deucher         2015-04-20  259  	default:
d38ceaf99ed015 Alex Deucher         2015-04-20  260  		return -EINVAL;
d38ceaf99ed015 Alex Deucher         2015-04-20  261  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  262  
b406477c614f08 Mario Limonciello    2023-01-04  263  	r = amdgpu_ucode_request(adev, &adev->uvd.fw, fw_name);
d38ceaf99ed015 Alex Deucher         2015-04-20  264  	if (r) {
d38ceaf99ed015 Alex Deucher         2015-04-20  265  		dev_err(adev->dev, "amdgpu_uvd: Can't validate firmware \"%s\"\n",
d38ceaf99ed015 Alex Deucher         2015-04-20  266  			fw_name);
b406477c614f08 Mario Limonciello    2023-01-04  267  		amdgpu_ucode_release(&adev->uvd.fw);
d38ceaf99ed015 Alex Deucher         2015-04-20  268  		return r;
d38ceaf99ed015 Alex Deucher         2015-04-20  269  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  270  
c036554170fcc2 Arindam Nath         2016-04-12  271  	/* Set the default UVD handles that the firmware can handle */
c036554170fcc2 Arindam Nath         2016-04-12  272  	adev->uvd.max_handles = AMDGPU_DEFAULT_UVD_HANDLES;
c036554170fcc2 Arindam Nath         2016-04-12  273  
d38ceaf99ed015 Alex Deucher         2015-04-20  274  	hdr = (const struct common_firmware_header *)adev->uvd.fw->data;
d38ceaf99ed015 Alex Deucher         2015-04-20  275  	family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
dd06eecb73d2e5 James Zhu            2018-06-06  276  
dd06eecb73d2e5 James Zhu            2018-06-06  277  	if (adev->asic_type < CHIP_VEGA20) {
f10984a353c87e Srinivasan Shanmugam 2023-05-17  278  		unsigned int version_major, version_minor;
5c219927027558 Alex Deucher         2018-06-14  279  
d38ceaf99ed015 Alex Deucher         2015-04-20  280  		version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
d38ceaf99ed015 Alex Deucher         2015-04-20  281  		version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
0b437e64e0af74 Tom Rix              2020-12-15  282  		DRM_INFO("Found UVD firmware Version: %u.%u Family ID: %u\n",
d38ceaf99ed015 Alex Deucher         2015-04-20  283  			version_major, version_minor, family_id);
d38ceaf99ed015 Alex Deucher         2015-04-20  284  
c036554170fcc2 Arindam Nath         2016-04-12  285  		/*
c036554170fcc2 Arindam Nath         2016-04-12  286  		 * Limit the number of UVD handles depending on microcode major
c036554170fcc2 Arindam Nath         2016-04-12  287  		 * and minor versions. The firmware version which has 40 UVD
c036554170fcc2 Arindam Nath         2016-04-12  288  		 * instances support is 1.80. So all subsequent versions should
c036554170fcc2 Arindam Nath         2016-04-12  289  		 * also have the same support.
c036554170fcc2 Arindam Nath         2016-04-12  290  		 */
5c219927027558 Alex Deucher         2018-06-14  291  		if ((version_major > 0x01) ||
c036554170fcc2 Arindam Nath         2016-04-12  292  		    ((version_major == 0x01) && (version_minor >= 0x50)))
c036554170fcc2 Arindam Nath         2016-04-12  293  			adev->uvd.max_handles = AMDGPU_MAX_UVD_HANDLES;
c036554170fcc2 Arindam Nath         2016-04-12  294  
562e2689baebaa Sonny Jiang          2016-04-18  295  		adev->uvd.fw_version = ((version_major << 24) | (version_minor << 16) |
562e2689baebaa Sonny Jiang          2016-04-18  296  					(family_id << 8));
562e2689baebaa Sonny Jiang          2016-04-18  297  
8e008dd70e0cf5 Sonny Jiang          2016-05-11  298  		if ((adev->asic_type == CHIP_POLARIS10 ||
8e008dd70e0cf5 Sonny Jiang          2016-05-11  299  		     adev->asic_type == CHIP_POLARIS11) &&
8e008dd70e0cf5 Sonny Jiang          2016-05-11  300  		    (adev->uvd.fw_version < FW_1_66_16))
7d98d416c2cc1c Arnd Bergmann        2021-03-22  301  			DRM_ERROR("POLARIS10/11 UVD firmware version %u.%u is too old.\n",
8e008dd70e0cf5 Sonny Jiang          2016-05-11  302  				  version_major, version_minor);
5c219927027558 Alex Deucher         2018-06-14  303  	} else {
5c219927027558 Alex Deucher         2018-06-14  304  		unsigned int enc_major, enc_minor, dec_minor;
5c219927027558 Alex Deucher         2018-06-14  305  
5c219927027558 Alex Deucher         2018-06-14  306  		dec_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
5c219927027558 Alex Deucher         2018-06-14  307  		enc_minor = (le32_to_cpu(hdr->ucode_version) >> 24) & 0x3f;
5c219927027558 Alex Deucher         2018-06-14  308  		enc_major = (le32_to_cpu(hdr->ucode_version) >> 30) & 0x3;
0b437e64e0af74 Tom Rix              2020-12-15  309  		DRM_INFO("Found UVD firmware ENC: %u.%u DEC: .%u Family ID: %u\n",
5c219927027558 Alex Deucher         2018-06-14  310  			enc_major, enc_minor, dec_minor, family_id);
5c219927027558 Alex Deucher         2018-06-14  311  
5c219927027558 Alex Deucher         2018-06-14  312  		adev->uvd.max_handles = AMDGPU_MAX_UVD_HANDLES;
5c219927027558 Alex Deucher         2018-06-14  313  
5c219927027558 Alex Deucher         2018-06-14 @314  		adev->uvd.fw_version = le32_to_cpu(hdr->ucode_version);
5c219927027558 Alex Deucher         2018-06-14  315  	}
8e008dd70e0cf5 Sonny Jiang          2016-05-11  316  
09bfb8912dc163 Leo Liu              2017-03-03  317  	bo_size = AMDGPU_UVD_STACK_SIZE + AMDGPU_UVD_HEAP_SIZE
c036554170fcc2 Arindam Nath         2016-04-12  318  		  +  AMDGPU_UVD_SESSION_SIZE * adev->uvd.max_handles;
09bfb8912dc163 Leo Liu              2017-03-03  319  	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
09bfb8912dc163 Leo Liu              2017-03-03 @320  		bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
09bfb8912dc163 Leo Liu              2017-03-03  321  
10dd74eac4dba9 James Zhu            2018-05-15  322  	for (j = 0; j < adev->uvd.num_uvd_inst; j++) {
f1e582ebfd703e Alex Deucher         2018-07-25  323  		if (adev->uvd.harvest_config & (1 << j))
f1e582ebfd703e Alex Deucher         2018-07-25  324  			continue;
4b62e697777d79 Christian König      2016-07-25  325  		r = amdgpu_bo_create_kernel(adev, bo_size, PAGE_SIZE,
58ab2c08d708ca Christian König      2022-01-14  326  					    AMDGPU_GEM_DOMAIN_VRAM |
58ab2c08d708ca Christian König      2022-01-14  327  					    AMDGPU_GEM_DOMAIN_GTT,
58ab2c08d708ca Christian König      2022-01-14  328  					    &adev->uvd.inst[j].vcpu_bo,
58ab2c08d708ca Christian König      2022-01-14  329  					    &adev->uvd.inst[j].gpu_addr,
58ab2c08d708ca Christian König      2022-01-14  330  					    &adev->uvd.inst[j].cpu_addr);
d38ceaf99ed015 Alex Deucher         2015-04-20  331  		if (r) {
d38ceaf99ed015 Alex Deucher         2015-04-20  332  			dev_err(adev->dev, "(%d) failed to allocate UVD bo\n", r);
d38ceaf99ed015 Alex Deucher         2015-04-20  333  			return r;
d38ceaf99ed015 Alex Deucher         2015-04-20  334  		}
5c675bf2c67c4e Christian König      2018-07-18  335  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  336  
c036554170fcc2 Arindam Nath         2016-04-12  337  	for (i = 0; i < adev->uvd.max_handles; ++i) {
5c675bf2c67c4e Christian König      2018-07-18  338  		atomic_set(&adev->uvd.handles[i], 0);
5c675bf2c67c4e Christian König      2018-07-18  339  		adev->uvd.filp[i] = NULL;
d38ceaf99ed015 Alex Deucher         2015-04-20  340  	}
5c675bf2c67c4e Christian König      2018-07-18  341  
d38ceaf99ed015 Alex Deucher         2015-04-20  342  	/* from uvd v5.0 HW addressing capacity increased to 64 bits */
2990a1fc012e1b Alex Deucher         2017-12-15  343  	if (!amdgpu_device_ip_block_version_cmp(adev, AMD_IP_BLOCK_TYPE_UVD, 5, 0))
d38ceaf99ed015 Alex Deucher         2015-04-20  344  		adev->uvd.address_64_bit = true;
d38ceaf99ed015 Alex Deucher         2015-04-20  345  
68331d7cf3a9cd xinhui pan           2021-09-10  346  	r = amdgpu_uvd_create_msg_bo_helper(adev, 128 << 10, &adev->uvd.ib_bo);
68331d7cf3a9cd xinhui pan           2021-09-10  347  	if (r)
68331d7cf3a9cd xinhui pan           2021-09-10  348  		return r;
68331d7cf3a9cd xinhui pan           2021-09-10  349  
4cb5877c6352c4 Christian König      2016-07-26  350  	switch (adev->asic_type) {
4cb5877c6352c4 Christian König      2016-07-26  351  	case CHIP_TONGA:
4cb5877c6352c4 Christian König      2016-07-26  352  		adev->uvd.use_ctx_buf = adev->uvd.fw_version >= FW_1_65_10;
4cb5877c6352c4 Christian König      2016-07-26  353  		break;
4cb5877c6352c4 Christian König      2016-07-26  354  	case CHIP_CARRIZO:
4cb5877c6352c4 Christian König      2016-07-26  355  		adev->uvd.use_ctx_buf = adev->uvd.fw_version >= FW_1_87_11;
4cb5877c6352c4 Christian König      2016-07-26  356  		break;
4cb5877c6352c4 Christian König      2016-07-26  357  	case CHIP_FIJI:
4cb5877c6352c4 Christian König      2016-07-26  358  		adev->uvd.use_ctx_buf = adev->uvd.fw_version >= FW_1_87_12;
4cb5877c6352c4 Christian König      2016-07-26  359  		break;
4cb5877c6352c4 Christian König      2016-07-26  360  	case CHIP_STONEY:
4cb5877c6352c4 Christian König      2016-07-26  361  		adev->uvd.use_ctx_buf = adev->uvd.fw_version >= FW_1_37_15;
4cb5877c6352c4 Christian König      2016-07-26  362  		break;
4cb5877c6352c4 Christian König      2016-07-26  363  	default:
4cb5877c6352c4 Christian König      2016-07-26  364  		adev->uvd.use_ctx_buf = adev->asic_type >= CHIP_POLARIS10;
4cb5877c6352c4 Christian König      2016-07-26  365  	}
4cb5877c6352c4 Christian König      2016-07-26  366  
d38ceaf99ed015 Alex Deucher         2015-04-20  367  	return 0;
d38ceaf99ed015 Alex Deucher         2015-04-20  368  }
d38ceaf99ed015 Alex Deucher         2015-04-20  369  
d38ceaf99ed015 Alex Deucher         2015-04-20  370  int amdgpu_uvd_sw_fini(struct amdgpu_device *adev)
d38ceaf99ed015 Alex Deucher         2015-04-20  371  {
68331d7cf3a9cd xinhui pan           2021-09-10  372  	void *addr = amdgpu_bo_kptr(adev->uvd.ib_bo);
10dd74eac4dba9 James Zhu            2018-05-15  373  	int i, j;
d38ceaf99ed015 Alex Deucher         2015-04-20  374  
cdc50176597cb4 Nayan Deshmukh       2018-07-20  375  	drm_sched_entity_destroy(&adev->uvd.entity);
5c675bf2c67c4e Christian König      2018-07-18  376  
10dd74eac4dba9 James Zhu            2018-05-15  377  	for (j = 0; j < adev->uvd.num_uvd_inst; ++j) {
f1e582ebfd703e Alex Deucher         2018-07-25  378  		if (adev->uvd.harvest_config & (1 << j))
f1e582ebfd703e Alex Deucher         2018-07-25  379  			continue;
c9533d1bca3393 Michel Dänzer        2018-08-03  380  		kvfree(adev->uvd.inst[j].saved_bo);
ead833ecedfad7 Christian König      2016-02-10  381  
10dd74eac4dba9 James Zhu            2018-05-15  382  		amdgpu_bo_free_kernel(&adev->uvd.inst[j].vcpu_bo,
10dd74eac4dba9 James Zhu            2018-05-15  383  				      &adev->uvd.inst[j].gpu_addr,
10dd74eac4dba9 James Zhu            2018-05-15  384  				      (void **)&adev->uvd.inst[j].cpu_addr);
d38ceaf99ed015 Alex Deucher         2015-04-20  385  
10dd74eac4dba9 James Zhu            2018-05-15  386  		amdgpu_ring_fini(&adev->uvd.inst[j].ring);
4ff184d70e1dd8 Monk Liu             2017-09-15  387  
10dd74eac4dba9 James Zhu            2018-05-15  388  		for (i = 0; i < AMDGPU_MAX_UVD_ENC_RINGS; ++i)
10dd74eac4dba9 James Zhu            2018-05-15  389  			amdgpu_ring_fini(&adev->uvd.inst[j].ring_enc[i]);
10dd74eac4dba9 James Zhu            2018-05-15  390  	}
68331d7cf3a9cd xinhui pan           2021-09-10  391  	amdgpu_bo_free_kernel(&adev->uvd.ib_bo, NULL, &addr);
b406477c614f08 Mario Limonciello    2023-01-04  392  	amdgpu_ucode_release(&adev->uvd.fw);
d38ceaf99ed015 Alex Deucher         2015-04-20  393  
d38ceaf99ed015 Alex Deucher         2015-04-20  394  	return 0;
d38ceaf99ed015 Alex Deucher         2015-04-20  395  }
d38ceaf99ed015 Alex Deucher         2015-04-20  396  
33d5bd0705440c Emily Deng           2018-08-13  397  /**
33d5bd0705440c Emily Deng           2018-08-13  398   * amdgpu_uvd_entity_init - init entity
33d5bd0705440c Emily Deng           2018-08-13  399   *
33d5bd0705440c Emily Deng           2018-08-13  400   * @adev: amdgpu_device pointer
33d5bd0705440c Emily Deng           2018-08-13  401   *
33d5bd0705440c Emily Deng           2018-08-13  402   */
33d5bd0705440c Emily Deng           2018-08-13  403  int amdgpu_uvd_entity_init(struct amdgpu_device *adev)
33d5bd0705440c Emily Deng           2018-08-13  404  {
33d5bd0705440c Emily Deng           2018-08-13  405  	struct amdgpu_ring *ring;
b3ac17667f115e Nirmoy Das           2019-12-05  406  	struct drm_gpu_scheduler *sched;
33d5bd0705440c Emily Deng           2018-08-13  407  	int r;
33d5bd0705440c Emily Deng           2018-08-13  408  
33d5bd0705440c Emily Deng           2018-08-13  409  	ring = &adev->uvd.inst[0].ring;
b3ac17667f115e Nirmoy Das           2019-12-05  410  	sched = &ring->sched;
b3ac17667f115e Nirmoy Das           2019-12-05  411  	r = drm_sched_entity_init(&adev->uvd.entity, DRM_SCHED_PRIORITY_NORMAL,
b3ac17667f115e Nirmoy Das           2019-12-05  412  				  &sched, 1, NULL);
33d5bd0705440c Emily Deng           2018-08-13  413  	if (r) {
33d5bd0705440c Emily Deng           2018-08-13  414  		DRM_ERROR("Failed setting up UVD kernel entity.\n");
33d5bd0705440c Emily Deng           2018-08-13  415  		return r;
33d5bd0705440c Emily Deng           2018-08-13  416  	}
33d5bd0705440c Emily Deng           2018-08-13  417  
33d5bd0705440c Emily Deng           2018-08-13  418  	return 0;
33d5bd0705440c Emily Deng           2018-08-13  419  }
33d5bd0705440c Emily Deng           2018-08-13  420  
d38ceaf99ed015 Alex Deucher         2015-04-20  421  int amdgpu_uvd_suspend(struct amdgpu_device *adev)
d38ceaf99ed015 Alex Deucher         2015-04-20  422  {
f10984a353c87e Srinivasan Shanmugam 2023-05-17  423  	unsigned int size;
3f99dd814a6fdf Leo Liu              2016-04-01  424  	void *ptr;
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  425  	int i, j, idx;
76434f75d4a485 Le Ma                2019-11-27  426  	bool in_ras_intr = amdgpu_ras_intr_triggered();
d38ceaf99ed015 Alex Deucher         2015-04-20  427  
5c53d19b76dccb James Zhu            2018-06-18  428  	cancel_delayed_work_sync(&adev->uvd.idle_work);
5c53d19b76dccb James Zhu            2018-06-18  429  
f6c3b601bd490e James Zhu            2018-03-06  430  	/* only valid for physical mode */
f6c3b601bd490e James Zhu            2018-03-06  431  	if (adev->asic_type < CHIP_POLARIS10) {
c036554170fcc2 Arindam Nath         2016-04-12  432  		for (i = 0; i < adev->uvd.max_handles; ++i)
5c675bf2c67c4e Christian König      2018-07-18  433  			if (atomic_read(&adev->uvd.handles[i]))
3f99dd814a6fdf Leo Liu              2016-04-01  434  				break;
d38ceaf99ed015 Alex Deucher         2015-04-20  435  
ec7549df08c20e James Zhu            2018-03-06  436  		if (i == adev->uvd.max_handles)
5c675bf2c67c4e Christian König      2018-07-18  437  			return 0;
f6c3b601bd490e James Zhu            2018-03-06  438  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  439  
5c675bf2c67c4e Christian König      2018-07-18  440  	for (j = 0; j < adev->uvd.num_uvd_inst; ++j) {
f1e582ebfd703e Alex Deucher         2018-07-25  441  		if (adev->uvd.harvest_config & (1 << j))
f1e582ebfd703e Alex Deucher         2018-07-25  442  			continue;
5c675bf2c67c4e Christian König      2018-07-18  443  		if (adev->uvd.inst[j].vcpu_bo == NULL)
5c675bf2c67c4e Christian König      2018-07-18  444  			continue;
5c675bf2c67c4e Christian König      2018-07-18  445  
10dd74eac4dba9 James Zhu            2018-05-15  446  		size = amdgpu_bo_size(adev->uvd.inst[j].vcpu_bo);
10dd74eac4dba9 James Zhu            2018-05-15  447  		ptr = adev->uvd.inst[j].cpu_addr;
3f99dd814a6fdf Leo Liu              2016-04-01  448  
c9533d1bca3393 Michel Dänzer        2018-08-03  449  		adev->uvd.inst[j].saved_bo = kvmalloc(size, GFP_KERNEL);
10dd74eac4dba9 James Zhu            2018-05-15  450  		if (!adev->uvd.inst[j].saved_bo)
3f99dd814a6fdf Leo Liu              2016-04-01  451  			return -ENOMEM;
3f99dd814a6fdf Leo Liu              2016-04-01  452  
c58a863b1ccf63 Guchun Chen          2021-10-08  453  		if (drm_dev_enter(adev_to_drm(adev), &idx)) {
8baaadba735565 Le Ma                2019-10-25  454  			/* re-write 0 since err_event_athub will corrupt VCPU buffer */
76434f75d4a485 Le Ma                2019-11-27  455  			if (in_ras_intr)
8baaadba735565 Le Ma                2019-10-25  456  				memset(adev->uvd.inst[j].saved_bo, 0, size);
76434f75d4a485 Le Ma                2019-11-27  457  			else
10dd74eac4dba9 James Zhu            2018-05-15 @458  				memcpy_fromio(adev->uvd.inst[j].saved_bo, ptr, size);
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  459  
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  460  			drm_dev_exit(idx);
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  461  		}
10dd74eac4dba9 James Zhu            2018-05-15  462  	}
76434f75d4a485 Le Ma                2019-11-27  463  
76434f75d4a485 Le Ma                2019-11-27  464  	if (in_ras_intr)
76434f75d4a485 Le Ma                2019-11-27  465  		DRM_WARN("UVD VCPU state may lost due to RAS ERREVENT_ATHUB_INTERRUPT\n");
76434f75d4a485 Le Ma                2019-11-27  466  
d38ceaf99ed015 Alex Deucher         2015-04-20  467  	return 0;
d38ceaf99ed015 Alex Deucher         2015-04-20  468  }
d38ceaf99ed015 Alex Deucher         2015-04-20  469  
d38ceaf99ed015 Alex Deucher         2015-04-20  470  int amdgpu_uvd_resume(struct amdgpu_device *adev)
d38ceaf99ed015 Alex Deucher         2015-04-20  471  {
f10984a353c87e Srinivasan Shanmugam 2023-05-17  472  	unsigned int size;
d38ceaf99ed015 Alex Deucher         2015-04-20  473  	void *ptr;
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  474  	int i, idx;
d38ceaf99ed015 Alex Deucher         2015-04-20  475  
10dd74eac4dba9 James Zhu            2018-05-15  476  	for (i = 0; i < adev->uvd.num_uvd_inst; i++) {
f1e582ebfd703e Alex Deucher         2018-07-25  477  		if (adev->uvd.harvest_config & (1 << i))
f1e582ebfd703e Alex Deucher         2018-07-25  478  			continue;
10dd74eac4dba9 James Zhu            2018-05-15  479  		if (adev->uvd.inst[i].vcpu_bo == NULL)
d38ceaf99ed015 Alex Deucher         2015-04-20  480  			return -EINVAL;
d38ceaf99ed015 Alex Deucher         2015-04-20  481  
10dd74eac4dba9 James Zhu            2018-05-15  482  		size = amdgpu_bo_size(adev->uvd.inst[i].vcpu_bo);
10dd74eac4dba9 James Zhu            2018-05-15  483  		ptr = adev->uvd.inst[i].cpu_addr;
d38ceaf99ed015 Alex Deucher         2015-04-20  484  
10dd74eac4dba9 James Zhu            2018-05-15  485  		if (adev->uvd.inst[i].saved_bo != NULL) {
c58a863b1ccf63 Guchun Chen          2021-10-08  486  			if (drm_dev_enter(adev_to_drm(adev), &idx)) {
10dd74eac4dba9 James Zhu            2018-05-15 @487  				memcpy_toio(ptr, adev->uvd.inst[i].saved_bo, size);
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  488  				drm_dev_exit(idx);
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  489  			}
c9533d1bca3393 Michel Dänzer        2018-08-03  490  			kvfree(adev->uvd.inst[i].saved_bo);
10dd74eac4dba9 James Zhu            2018-05-15  491  			adev->uvd.inst[i].saved_bo = NULL;
d23be4e34c2bcb Leo Liu              2016-04-04  492  		} else {
d23be4e34c2bcb Leo Liu              2016-04-04  493  			const struct common_firmware_header *hdr;
f10984a353c87e Srinivasan Shanmugam 2023-05-17  494  			unsigned int offset;
d23be4e34c2bcb Leo Liu              2016-04-04  495  
d23be4e34c2bcb Leo Liu              2016-04-04  496  			hdr = (const struct common_firmware_header *)adev->uvd.fw->data;
09bfb8912dc163 Leo Liu              2017-03-03  497  			if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
d23be4e34c2bcb Leo Liu              2016-04-04  498  				offset = le32_to_cpu(hdr->ucode_array_offset_bytes);
c58a863b1ccf63 Guchun Chen          2021-10-08  499  				if (drm_dev_enter(adev_to_drm(adev), &idx)) {
10dd74eac4dba9 James Zhu            2018-05-15 @500  					memcpy_toio(adev->uvd.inst[i].cpu_addr, adev->uvd.fw->data + offset,
ba0b2275a6781b Christian König      2016-08-23  501  						    le32_to_cpu(hdr->ucode_size_bytes));
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  502  					drm_dev_exit(idx);
f89f8c6bafd069 Andrey Grodzovsky    2021-05-12  503  				}
d23be4e34c2bcb Leo Liu              2016-04-04  504  				size -= le32_to_cpu(hdr->ucode_size_bytes);
d23be4e34c2bcb Leo Liu              2016-04-04  505  				ptr += le32_to_cpu(hdr->ucode_size_bytes);
09bfb8912dc163 Leo Liu              2017-03-03  506  			}
ba0b2275a6781b Christian König      2016-08-23  507  			memset_io(ptr, 0, size);
3b1186fd2aa4ab Jim Qu               2017-12-18  508  			/* to restore uvd fence seq */
10dd74eac4dba9 James Zhu            2018-05-15  509  			amdgpu_fence_driver_force_completion(&adev->uvd.inst[i].ring);
10dd74eac4dba9 James Zhu            2018-05-15  510  		}
d23be4e34c2bcb Leo Liu              2016-04-04  511  	}
d38ceaf99ed015 Alex Deucher         2015-04-20  512  	return 0;
d38ceaf99ed015 Alex Deucher         2015-04-20  513  }
d38ceaf99ed015 Alex Deucher         2015-04-20  514  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
