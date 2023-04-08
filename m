Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863506DBC54
	for <lists+dri-devel@lfdr.de>; Sat,  8 Apr 2023 19:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798D210E12C;
	Sat,  8 Apr 2023 17:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5501B10E12C
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Apr 2023 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680974829; x=1712510829;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=20Gp8Ob9sY0l7Q3kLwGChvRjnxAHs9YuVEd44YUhsWE=;
 b=M7E42hQgR4A/CvU2XrlUglH068Nbo4KKBMrpjLQULI+ayRmQr7sHH2W7
 MUfMHY5cBgV6pcpPfzV90aFdbEe2QFVtIbcj+4xKOwE5dH8jWKq+5X7A7
 JFIEADgfXIKVN26fyXtKmXqiEqmY90Q99qPjhKHPHMOHsbSSMbQi6juQZ
 HPx6WP7x/OgYgSy5FQkhS1jxqc+QmtEQnZC9E1PSN/QbaiisFMwB1ndU5
 4rvzDrkQobR3nLOrZ8dvQ2dRogIN8/NhipXeM1X/3iO4EIwGuctgQYdmI
 ZvYfncjLp/EfU4dd59OjerRJlNBMKAKZEAGDD45gGhTaOmXe5akm4IEC/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="322789170"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="322789170"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2023 10:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="681311839"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; d="scan'208";a="681311839"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 08 Apr 2023 10:27:04 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1plCLA-000Twb-01;
 Sat, 08 Apr 2023 17:27:04 +0000
Date: Sun, 9 Apr 2023 01:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>, gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: fbtft: fbtft-bus.c added params
Message-ID: <202304090139.b8XZpHpu-lkp@intel.com>
References: <20230408081817.81562-1-kartikey406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408081817.81562-1-kartikey406@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev, Deepanshu Kartikey <kartikey406@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Deepanshu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/staging-fbtft-fbtft-bus-c-added-params/20230408-161947
patch link:    https://lore.kernel.org/r/20230408081817.81562-1-kartikey406%40gmail.com
patch subject: [PATCH] staging: fbtft: fbtft-bus.c added params
config: i386-randconfig-s001-20230403 (https://download.01.org/0day-ci/archive/20230409/202304090139.b8XZpHpu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/038bedbb2c34ffc5e5ce77d5f49811778be8d631
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Deepanshu-Kartikey/staging-fbtft-fbtft-bus-c-added-params/20230408-161947
        git checkout 038bedbb2c34ffc5e5ce77d5f49811778be8d631
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/staging/fbtft/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304090139.b8XZpHpu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/fbtft/fbtft-bus.c:65:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __be16 [usertype] @@
   drivers/staging/fbtft/fbtft-bus.c:65:1: sparse:     expected unsigned char [usertype]
   drivers/staging/fbtft/fbtft-bus.c:65:1: sparse:     got restricted __be16 [usertype]
>> drivers/staging/fbtft/fbtft-bus.c:65:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __be16 [usertype] @@
   drivers/staging/fbtft/fbtft-bus.c:65:1: sparse:     expected unsigned char [usertype]
   drivers/staging/fbtft/fbtft-bus.c:65:1: sparse:     got restricted __be16 [usertype]
>> drivers/staging/fbtft/fbtft-bus.c:65:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] @@     got restricted __be16 [usertype] @@
   drivers/staging/fbtft/fbtft-bus.c:65:1: sparse:     expected unsigned char [usertype]
   drivers/staging/fbtft/fbtft-bus.c:65:1: sparse:     got restricted __be16 [usertype]
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse:     expected unsigned short [usertype]
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse:     got restricted __be16 [usertype]
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse:     expected unsigned short [usertype]
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse:     got restricted __be16 [usertype]
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse:     expected unsigned short [usertype]
   drivers/staging/fbtft/fbtft-bus.c:67:1: sparse:     got restricted __be16 [usertype]

vim +65 drivers/staging/fbtft/fbtft-bus.c

    64	
  > 65	define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, cpu_to_be16);
    66	define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16);
    67	define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, cpu_to_be16);
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
