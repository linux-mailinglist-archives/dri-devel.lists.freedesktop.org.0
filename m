Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBFA72869B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 19:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE40510E605;
	Thu,  8 Jun 2023 17:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83D110E604;
 Thu,  8 Jun 2023 17:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686246593; x=1717782593;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RxhEFQWHkmrAiMGLSVcuoaUWrTNxrZkuEvjmchpES0k=;
 b=bOglpmcnHmf+bs94Y64jXAMTzq9lQVbpESs80Gk763eKcuuVOxPB92L6
 Ob/XNzyHt/j6Qe/aJ9a+N1tk0nHttm7i6t3DZzrwAgiSZ0IcUsUD7zBDF
 mKgOFrOKHxSW5PhvNO+QyEgRQyx695ZFNee1yyTJl4yMbVn4XlTdz8zsG
 YZjn7lbYJa2Ge/YYnb9rEJKtWX5m96AJgfpQEHmA3fqpz6dLdDrUjIBns
 7cx0EJusqGNVoW1ylJw1vemG6HolMSHquxXSp9RnY0AQC73smRHxwqJg9
 6fEVQJC6ySPQSaeEYlDAsJzR58InKPqYVeFreq1ykHi8MnW/dN2iOHhvJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="420966957"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="420966957"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 10:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="710056199"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="710056199"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 10:49:34 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1q7JlO-00087m-0P;
 Thu, 08 Jun 2023 17:49:34 +0000
Date: Fri, 9 Jun 2023 01:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] drm/i915: Record which clients own a VM
Message-ID: <202306090149.5gHC8re3-lkp@intel.com>
References: <20230608145133.1059554-3-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608145133.1059554-3-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-i915-Track-buffer-objects-belonging-to-clients/20230608-225344
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230608145133.1059554-3-tvrtko.ursulin%40linux.intel.com
patch subject: [PATCH 2/5] drm/i915: Record which clients own a VM
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230609/202306090149.5gHC8re3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch drm-tip drm-tip
        git checkout drm-tip/drm-tip
        b4 shazam https://lore.kernel.org/r/20230608145133.1059554-3-tvrtko.ursulin@linux.intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090149.5gHC8re3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/gem/i915_gem_context.c:2587:
   drivers/gpu/drm/i915/gem/selftests/mock_context.c: In function 'live_context':
>> drivers/gpu/drm/i915/gem/selftests/mock_context.c:86:35: error: passing argument 1 of 'proto_context_create' from incompatible pointer type [-Werror=incompatible-pointer-types]
      86 |         pc = proto_context_create(i915, 0);
         |                                   ^~~~
         |                                   |
         |                                   struct drm_i915_private *
   drivers/gpu/drm/i915/gem/i915_gem_context.c:282:52: note: expected 'struct drm_i915_file_private *' but argument is of type 'struct drm_i915_private *'
     282 | proto_context_create(struct drm_i915_file_private *fpriv,
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>> drivers/gpu/drm/i915/gem/selftests/mock_context.c:86:14: error: too few arguments to function 'proto_context_create'
      86 |         pc = proto_context_create(i915, 0);
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_context.c:282:1: note: declared here
     282 | proto_context_create(struct drm_i915_file_private *fpriv,
         | ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/selftests/mock_context.c: In function 'kernel_context':
   drivers/gpu/drm/i915/gem/selftests/mock_context.c:155:35: error: passing argument 1 of 'proto_context_create' from incompatible pointer type [-Werror=incompatible-pointer-types]
     155 |         pc = proto_context_create(i915, 0);
         |                                   ^~~~
         |                                   |
         |                                   struct drm_i915_private *
   drivers/gpu/drm/i915/gem/i915_gem_context.c:282:52: note: expected 'struct drm_i915_file_private *' but argument is of type 'struct drm_i915_private *'
     282 | proto_context_create(struct drm_i915_file_private *fpriv,
         |                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   drivers/gpu/drm/i915/gem/selftests/mock_context.c:155:14: error: too few arguments to function 'proto_context_create'
     155 |         pc = proto_context_create(i915, 0);
         |              ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gem/i915_gem_context.c:282:1: note: declared here
     282 | proto_context_create(struct drm_i915_file_private *fpriv,
         | ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/proto_context_create +86 drivers/gpu/drm/i915/gem/selftests/mock_context.c

79f0f4724d9c50 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2017-07-21   76  
79f0f4724d9c50 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2017-07-21   77  struct i915_gem_context *
a8c9a7f52ec5a4 drivers/gpu/drm/i915/gem/selftests/mock_context.c Chris Wilson           2019-11-07   78  live_context(struct drm_i915_private *i915, struct file *file)
79f0f4724d9c50 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2017-07-21   79  {
a4c1cdd34e2cda drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08   80  	struct drm_i915_file_private *fpriv = to_drm_file(file)->driver_priv;
a34857dc92475a drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08   81  	struct i915_gem_proto_context *pc;
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   82  	struct i915_gem_context *ctx;
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   83  	int err;
c100777cc00ce9 drivers/gpu/drm/i915/gem/selftests/mock_context.c Tvrtko Ursulin         2019-12-24   84  	u32 id;
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   85  
a34857dc92475a drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08  @86  	pc = proto_context_create(i915, 0);
a34857dc92475a drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08   87  	if (IS_ERR(pc))
a34857dc92475a drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08   88  		return ERR_CAST(pc);
a34857dc92475a drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08   89  
a34857dc92475a drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08   90  	ctx = i915_gem_create_context(i915, pc);
d3ac8d42168a9b drivers/gpu/drm/i915/gem/selftests/mock_context.c Daniele Ceraolo Spurio 2021-09-24   91  	proto_context_close(i915, pc);
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   92  	if (IS_ERR(ctx))
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   93  		return ctx;
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   94  
03d0ed8a8e9300 drivers/gpu/drm/i915/gem/selftests/mock_context.c Chris Wilson           2020-01-28   95  	i915_gem_context_set_no_error_capture(ctx);
03d0ed8a8e9300 drivers/gpu/drm/i915/gem/selftests/mock_context.c Chris Wilson           2020-01-28   96  
a4c1cdd34e2cda drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08   97  	err = xa_alloc(&fpriv->context_xa, &id, NULL, xa_limit_32b, GFP_KERNEL);
3e05531243d032 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   98  	if (err < 0)
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21   99  		goto err_ctx;
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21  100  
a4c1cdd34e2cda drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08  101  	gem_context_register(ctx, fpriv, id);
a4c1cdd34e2cda drivers/gpu/drm/i915/gem/selftests/mock_context.c Faith Ekstrand         2021-07-08  102  
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21  103  	return ctx;
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21  104  
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21  105  err_ctx:
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21  106  	context_close(ctx);
3aa9945a528e76 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2019-03-21  107  	return ERR_PTR(err);
79f0f4724d9c50 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2017-07-21  108  }
8ec21a7c4b5216 drivers/gpu/drm/i915/selftests/mock_context.c     Chris Wilson           2018-02-05  109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
