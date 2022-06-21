Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2605552A54
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 06:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C8810F84D;
	Tue, 21 Jun 2022 04:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8413C10F84D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655786320; x=1687322320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wxRDMNaSdD/o6Y8ae4DltMvFeXD/i5ZhZHiA8fnXnDI=;
 b=hUHH+WBhNyzNe4kE30Ld1abIYvl5jnmCFGFHfi16/ZSc9HDTDZ1kgSex
 1t9r1048okioZERsLVzR0kn4OJprcQSn+cHSBcZK1XVEgsWmzmc8ZWhww
 lGG5+/9qzTmhh9RidEKqP0lrFFSx6QeeyaeK+ZQ56EyT8DqmOXVRaBObs
 gBl3mHDEd27OF+JkGpPnHhyK6gHGaG3R41BAW3fS4SBFE1FHSl/+g0q+B
 GJ1pbo3Nr90/pzVADQrTWIjiJ2QovuRu+R0InYbKQLn4rv/ml199pNnGy
 G1vVWQV847q30Equ+aN3rkE3uA2oMn9DqH8hxki4YlA8sIvsBcWNaxHlw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="305462560"
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="305462560"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 21:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,207,1650956400"; d="scan'208";a="764320018"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 20 Jun 2022 21:38:33 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o3Veq-000YIP-Vw;
 Tue, 21 Jun 2022 04:38:32 +0000
Date: Tue, 21 Jun 2022 12:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [PATCH] drm: Make drm_buddy a part of drm module
Message-ID: <202206211156.FjsteJJC-lkp@intel.com>
References: <20220621015151.11129-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621015151.11129-1-cai.huoqing@linux.dev>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Cai,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on linus/master v5.19-rc2 next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Huoqing/drm-Make-drm_buddy-a-part-of-drm-module/20220621-095417
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: microblaze-buildonly-randconfig-r003-20220620 (https://download.01.org/0day-ci/archive/20220621/202206211156.FjsteJJC-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/517d5f44c861a5173eaa9a06efebe2ce2a6601a1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cai-Huoqing/drm-Make-drm_buddy-a-part-of-drm-module/20220621-095417
        git checkout 517d5f44c861a5173eaa9a06efebe2ce2a6601a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   microblaze-linux-ld: drivers/gpu/drm/drm_buddy.o: in function `drm_buddy_block_print':
   drivers/gpu/drm/drm_buddy.c:731: undefined reference to `drm_printf'
   microblaze-linux-ld: drivers/gpu/drm/drm_buddy.o: in function `drm_buddy_print':
   drivers/gpu/drm/drm_buddy.c:745: undefined reference to `drm_printf'
>> microblaze-linux-ld: drivers/gpu/drm/drm_buddy.c:757: undefined reference to `drm_printf'
   microblaze-linux-ld: drivers/gpu/drm/drm_buddy.c:763: undefined reference to `drm_printf'
   microblaze-linux-ld: drivers/gpu/drm/drm_buddy.c:765: undefined reference to `drm_printf'
   microblaze-linux-ld: drivers/gpu/drm/drm_buddy.o:drivers/gpu/drm/drm_buddy.c:761: more undefined references to `drm_printf' follow

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
