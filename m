Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1157679DFC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C9A10E6BF;
	Tue, 24 Jan 2023 15:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B2210E6BF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 15:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674575527; x=1706111527;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TKXyp6BF4uP7pPnni9emuP3npRkFWBGkn8fJsz8K3gk=;
 b=i+Om6ZRM0n2BiXIr855FyBYn0hzOqnEwDGj7HA+yjCCEYvvkPnkA0Vb2
 Tqb9pm8JKHJh2nOIe6hWjOfwxaY4XpfJ5CRJDMwM1UJoz0bSooya88hrD
 TWspmilRdN8yLMrMxSsY+HgAgOc3rJBpLYA/EqgkiDn0ZyRnKBWGg5fjN
 B8J0ZTKKZO0BgPUD9Rmnd+JL+poMaB569b3dlxAFMp+4LrXzb5RIlvIT1
 DBWNGAdq62f4qGsd3Wz3H/R2oGvcl5xR+1mu17kFIlImWCcZEHUJZwW22
 yCkvu1YJnJ0FpAwsw9gNLfOONlPa9svLfsXNzGceHEFJnuoI3jJPLygHl Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="305984964"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="305984964"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 07:52:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750867256"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="750867256"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 07:52:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pKLaf-0006aC-02;
 Tue, 24 Jan 2023 15:52:05 +0000
Date: Tue, 24 Jan 2023 23:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Ravnborg via B4 Submission Endpoint
 <devnull+sam.ravnborg.org@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 16/86] drm/drm_print: Minimize include footprint
Message-ID: <202301242323.y0SNS3Fn-lkp@intel.com>
References: <20230113-drm-include-v1-v1-16-c5cf72d8a5a2@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113-drm-include-v1-v1-16-c5cf72d8a5a2@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

I love your patch! Yet something to improve:

[auto build test ERROR on 2e337a8d14bd4b04913d52ccf076be29d846acd7]

url:    https://github.com/intel-lab-lkp/linux/commits/Sam-Ravnborg-via-B4-Submission-Endpoint/drm-komeda-Direct-include-headers-from-drm_print/20230122-041306
base:   2e337a8d14bd4b04913d52ccf076be29d846acd7
patch link:    https://lore.kernel.org/r/20230113-drm-include-v1-v1-16-c5cf72d8a5a2%40ravnborg.org
patch subject: [PATCH 16/86] drm/drm_print: Minimize include footprint
config: nios2-randconfig-r012-20230123 (https://download.01.org/0day-ci/archive/20230124/202301242323.y0SNS3Fn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/530d852970d1a75527031a4f23689f89f0a85804
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sam-Ravnborg-via-B4-Submission-Endpoint/drm-komeda-Direct-include-headers-from-drm_print/20230122-041306
        git checkout 530d852970d1a75527031a4f23689f89f0a85804
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/arm/display/komeda/komeda_dev.c: In function 'komeda_register_show':
>> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:26:37: error: invalid use of undefined type 'struct seq_file'
      26 |         struct komeda_dev *mdev = sf->private;
         |                                     ^~
>> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:29:9: error: implicit declaration of function 'seq_puts' [-Werror=implicit-function-declaration]
      29 |         seq_puts(sf, "\n====== Komeda register dump =========\n");
         |         ^~~~~~~~
   drivers/gpu/drm/arm/display/komeda/komeda_dev.c: At top level:
>> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:44:1: warning: data definition has no type or storage class
      44 | DEFINE_SHOW_ATTRIBUTE(komeda_register);
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:44:1: error: type defaults to 'int' in declaration of 'DEFINE_SHOW_ATTRIBUTE' [-Werror=implicit-int]
>> drivers/gpu/drm/arm/display/komeda/komeda_dev.c:44:1: warning: parameter names (without types) in function declaration
   drivers/gpu/drm/arm/display/komeda/komeda_dev.c:24:12: warning: 'komeda_register_show' defined but not used [-Wunused-function]
      24 | static int komeda_register_show(struct seq_file *sf, void *x)
         |            ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +26 drivers/gpu/drm/arm/display/komeda/komeda_dev.c

bd628c1bed7902 james qian wang (Arm Technology China  2019-01-03  23) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  24) static int komeda_register_show(struct seq_file *sf, void *x)
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  25) {
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22 @26) 	struct komeda_dev *mdev = sf->private;
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  27) 	int i;
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  28) 
aefdaa15e54c09 Lowry Li (Arm Technology China         2019-09-17 @29) 	seq_puts(sf, "\n====== Komeda register dump =========\n");
aefdaa15e54c09 Lowry Li (Arm Technology China         2019-09-17  30) 
efb46508851874 james qian wang (Arm Technology China  2019-12-12  31) 	pm_runtime_get_sync(mdev->dev);
efb46508851874 james qian wang (Arm Technology China  2019-12-12  32) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  33) 	if (mdev->funcs->dump_register)
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  34) 		mdev->funcs->dump_register(mdev, sf);
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  35) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  36) 	for (i = 0; i < mdev->n_pipelines; i++)
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  37) 		komeda_pipeline_dump_register(mdev->pipelines[i], sf);
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  38) 
efb46508851874 james qian wang (Arm Technology China  2019-12-12  39) 	pm_runtime_put(mdev->dev);
efb46508851874 james qian wang (Arm Technology China  2019-12-12  40) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  41) 	return 0;
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  42) }
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  43) 
ef52d5853bf1d0 Qinglang Miao                          2020-09-17 @44  DEFINE_SHOW_ATTRIBUTE(komeda_register);
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  45) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
