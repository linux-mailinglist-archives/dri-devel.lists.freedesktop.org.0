Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D294BDAD8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 17:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EACC10E65B;
	Mon, 21 Feb 2022 16:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BBF10E410;
 Mon, 21 Feb 2022 16:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645461163; x=1676997163;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pr/Mp3XwZgiZMD7V6bzTmJaiLnTlkc7pKFRNKwbKdAc=;
 b=AYxANenqEwnnlE9KISVCJWsRLyE+zWVlKZS4BJVaexv1286jrNwPQlg6
 Lu10Xl+OIokhgL/sell+/EUiioQemn6oXw49eJIhPQqWzsudr6+RM1R3q
 +OZXQh9WqP3TE8SoqEuRn9pn2WsSbHreoAv55kaoF7iNh99zrQHXrxirN
 TbaeCRNlO6Nl6EukPaGqdwp45dXzygOMV3LNcmWJNqDfRxRbfTZeOny/U
 AZewU2mSznJY71F/R5HHh5oz/fMSx5/TcVLhUsf01VPnPd/Wgwdtr6UWP
 s2v2JhYZnkfSr0NFc1G6XPxaiDFygFmzBJhrtHAz4/8gM57VTLJWaZLR/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="337970047"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="337970047"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 08:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="507687536"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 21 Feb 2022 08:32:34 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMBc1-0001mY-UJ; Mon, 21 Feb 2022 16:32:33 +0000
Date: Tue, 22 Feb 2022 00:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jiawei Gu <Jiawei.Gu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Christian.Koenig@amd.com,
 Andrey.Grodzovsky@amd.com, Monk.Liu@amd.com, Emily.Deng@amd.com,
 Horace.Chen@amd.com
Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Message-ID: <202202220034.6C0UzU5E-lkp@intel.com>
References: <20220221095705.5290-1-Jiawei.Gu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221095705.5290-1-Jiawei.Gu@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Jiawei Gu <Jiawei.Gu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jiawei,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.17-rc5 next-20220217]
[cannot apply to drm-tip/drm-tip airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiawei-Gu/drm-sched-Add-device-pointer-to-drm_gpu_scheduler/20220221-175818
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r004-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220034.6C0UzU5E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9fdafca855faca0a3b8f213f024985c4112fa0bb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiawei-Gu/drm-sched-Add-device-pointer-to-drm_gpu_scheduler/20220221-175818
        git checkout 9fdafca855faca0a3b8f213f024985c4112fa0bb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/v3d/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/v3d/v3d_sched.c:394:28: error: implicit declaration of function 'to_platform_device' [-Werror,-Wimplicit-function-declaration]
                                NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
                                                   ^
   drivers/gpu/drm/v3d/v3d_drv.h:158:26: note: expanded from macro 'v3d_to_pdev'
   #define v3d_to_pdev(v3d) to_platform_device((v3d)->drm.dev)
                            ^
>> drivers/gpu/drm/v3d/v3d_sched.c:394:46: error: member reference type 'int' is not a pointer
                                NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
                                                   ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/v3d/v3d_sched.c:404:49: error: member reference type 'int' is not a pointer
                                NULL, "v3d_render", &(v3d_to_pdev(v3d)->dev));
                                                      ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/v3d/v3d_sched.c:416:46: error: member reference type 'int' is not a pointer
                                NULL, "v3d_tfu", &(v3d_to_pdev(v3d)->dev));
                                                   ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/v3d/v3d_sched.c:429:47: error: member reference type 'int' is not a pointer
                                        NULL, "v3d_csd", &(v3d_to_pdev(v3d)->dev));
                                                           ~~~~~~~~~~~~~~~~  ^
   drivers/gpu/drm/v3d/v3d_sched.c:441:55: error: member reference type 'int' is not a pointer
                                        NULL, "v3d_cache_clean", &(v3d_to_pdev(v3d)->dev));
                                                                   ~~~~~~~~~~~~~~~~  ^
   6 errors generated.


vim +/to_platform_device +394 drivers/gpu/drm/v3d/v3d_sched.c

   381	
   382	int
   383	v3d_sched_init(struct v3d_dev *v3d)
   384	{
   385		int hw_jobs_limit = 1;
   386		int job_hang_limit = 0;
   387		int hang_limit_ms = 500;
   388		int ret;
   389	
   390		ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
   391				     &v3d_bin_sched_ops,
   392				     hw_jobs_limit, job_hang_limit,
   393				     msecs_to_jiffies(hang_limit_ms), NULL,
 > 394				     NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
   395		if (ret) {
   396			dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
   397			return ret;
   398		}
   399	
   400		ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
   401				     &v3d_render_sched_ops,
   402				     hw_jobs_limit, job_hang_limit,
   403				     msecs_to_jiffies(hang_limit_ms), NULL,
   404				     NULL, "v3d_render", &(v3d_to_pdev(v3d)->dev));
   405		if (ret) {
   406			dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
   407				ret);
   408			v3d_sched_fini(v3d);
   409			return ret;
   410		}
   411	
   412		ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
   413				     &v3d_tfu_sched_ops,
   414				     hw_jobs_limit, job_hang_limit,
   415				     msecs_to_jiffies(hang_limit_ms), NULL,
   416				     NULL, "v3d_tfu", &(v3d_to_pdev(v3d)->dev));
   417		if (ret) {
   418			dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
   419				ret);
   420			v3d_sched_fini(v3d);
   421			return ret;
   422		}
   423	
   424		if (v3d_has_csd(v3d)) {
   425			ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
   426					     &v3d_csd_sched_ops,
   427					     hw_jobs_limit, job_hang_limit,
   428					     msecs_to_jiffies(hang_limit_ms), NULL,
   429					     NULL, "v3d_csd", &(v3d_to_pdev(v3d)->dev));
   430			if (ret) {
   431				dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
   432					ret);
   433				v3d_sched_fini(v3d);
   434				return ret;
   435			}
   436	
   437			ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
   438					     &v3d_cache_clean_sched_ops,
   439					     hw_jobs_limit, job_hang_limit,
   440					     msecs_to_jiffies(hang_limit_ms), NULL,
   441					     NULL, "v3d_cache_clean", &(v3d_to_pdev(v3d)->dev));
   442			if (ret) {
   443				dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
   444					ret);
   445				v3d_sched_fini(v3d);
   446				return ret;
   447			}
   448		}
   449	
   450		return 0;
   451	}
   452	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
