Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA950FBE4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 13:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E9E10E6CA;
	Tue, 26 Apr 2022 11:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4611E10E6CA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650972246; x=1682508246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=T7i7L2KegkqO2tC7i2wJS6jE33RflZWgdhR+pL1K13o=;
 b=YcD8EJH0Wm7nWv7+FMWxIITlii+8MiUJDF6fgILS7wSwIuOFGJgwqNoz
 xUhD32prqtdO3zzFaIA7nJExObrlQ9Ub3yiw+pbMKQQuz1doTC1IQyPEW
 Cv/guh5AXFoLJTxkNAkfVYvipkkp/CQPpAto9o+CVff1lo6TB2CeX9b1j
 4f2AC8m0yQyPRfKmBKDpDSLFK5x/BcUgGEM56u+8et9E6pjiBftdYkpZ/
 Sa2W8KDKQ594Qqz7wUrSD7P9nHp0LdzWMWjpojv0iULqsO4H8ceC3Iuqx
 V8lqJ5K3eSW8o3RzCP+Eza/BWUVqd+ngucwxrbpik64eZd64TDkWH7zrA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="246109246"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="246109246"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 04:24:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400"; d="scan'208";a="874412474"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 26 Apr 2022 04:24:02 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1njJIY-0003U6-1q;
 Tue, 26 Apr 2022 11:24:02 +0000
Date: Tue, 26 Apr 2022 19:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH v2 4/4] drm/nvdla/uapi: Add UAPI of NVDLA driver
Message-ID: <202204261945.UCAr92eM-lkp@intel.com>
References: <20220426060808.78225-5-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426060808.78225-5-cai.huoqing@linux.dev>
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
Cc: kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master linux/master v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220426-141148
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: ia64-randconfig-r021-20220425 (https://download.01.org/0day-ci/archive/20220426/202204261945.UCAr92eM-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a54587f7637b8ee11ad624794af3b409e6306e07
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cai-Huoqing/drm-nvdla-Add-driver-support-for-NVDLA/20220426-141148
        git checkout a54587f7637b8ee11ad624794af3b409e6306e07
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=ia64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> error: include/uapi/drm/nvdla_drm.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
   make[2]: *** [scripts/Makefile.headersinst:63: usr/include/drm/nvdla_drm.h] Error 1
   make[2]: Target '__headers' not remade because of errors.
   make[1]: *** [Makefile:1280: headers] Error 2
   arch/ia64/kernel/asm-offsets.c:23:6: warning: no previous prototype for 'foo' [-Wmissing-prototypes]
      23 | void foo(void)
         |      ^~~
   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
