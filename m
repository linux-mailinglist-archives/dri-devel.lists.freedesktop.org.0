Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0576F6DD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 03:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A580810E0EB;
	Fri,  4 Aug 2023 01:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335610E0EB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 01:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691112065; x=1722648065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hgge+CBwtoXhakToZ3cYiDf0b0sxbdauPcAOxk4YSf8=;
 b=hojMMCm284E6BK5AGufoiMctmU9TbMa9H+CJjvaR+ULiqqlqZCNdVLHx
 aJxSAu1J56QAYvTwWBvsnav+OpZhkLiILpG/8AwRTLpbPZKFtlAtKq87+
 xu65qJb+4qdhmWVmv9Q+RSoBRGjjq1Dr7hwZo3wyzfj0etB9XzwZ3b8Ta
 mADL5YK4XbwnCgOAKiMq3I5y7evOhNpodnI4QFtqy+mDKXpDoMjAE69Km
 OzlF02MjA5EDWqnTVBV1MrE8Wn9JS7203ck9vxvTH1M+bOXljMnRYDKHJ
 LSxvm6I4Ye8tml44oBPsWKcPdtPRxICbN0IV5zSxEEsiaY+GpI/2x5clD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349628185"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="349628185"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 18:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="706788342"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; d="scan'208";a="706788342"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 03 Aug 2023 18:20:58 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qRjUv-0002Vf-0z;
 Fri, 04 Aug 2023 01:20:57 +0000
Date: Fri, 4 Aug 2023 09:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: GUO Zihua <guozihua@huawei.com>, airlied@redhat.com
Subject: Re: [PATCH -next] agp: Make agp_gatt_table static
Message-ID: <202308040824.jnJY2iI7-lkp@intel.com>
References: <20230803020820.17414-1-guozihua@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803020820.17414-1-guozihua@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GUO,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230803]

url:    https://github.com/intel-lab-lkp/linux/commits/GUO-Zihua/agp-Make-agp_gatt_table-static/20230803-152304
base:   next-20230803
patch link:    https://lore.kernel.org/r/20230803020820.17414-1-guozihua%40huawei.com
patch subject: [PATCH -next] agp: Make agp_gatt_table static
config: x86_64-buildonly-randconfig-r001-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040824.jnJY2iI7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040824.jnJY2iI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040824.jnJY2iI7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `enable_gart_translations':
>> amd_gart_64.c:(.text+0x57ed5): undefined reference to `agp_gatt_table'
   ld: vmlinux.o: in function `init_amd_gatt':
>> amd_gart_64.c:(.init.text+0x40b96): undefined reference to `agp_gatt_table'
   ld: vmlinux.o: in function `gart_iommu_init':
>> (.init.text+0x411c7): undefined reference to `agp_gatt_table'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
