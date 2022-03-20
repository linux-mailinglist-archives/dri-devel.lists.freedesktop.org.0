Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9894E195A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Mar 2022 02:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3461E10E1BF;
	Sun, 20 Mar 2022 01:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E652610E1B8;
 Sun, 20 Mar 2022 01:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647740395; x=1679276395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oSZuhPV69Nlu9voU01AQp8trEEDyC9kKoSvGp5uKNus=;
 b=XseMaJ71/u3JrP8jDC9v9iEtx05OXvDXTi5cfn/5kiIzn3aLqXGePB+b
 EKC0AWlFIwiQCars62Q6uExVQyBI81I+OohkuuCrle5DMECCIaK3s3gt+
 w2awVEpi6v14g43+TpOq4YXOpibVjndvSD765/GrteSt3RrGA2finZY0e
 jxpWEOoz5lnE/4qK3rLwuKiDD7HZjGHFi3DHDGTLTRo8+cxlN1yHt9QVH
 nFLfcuYvnGllyg1JqTv2IpbA0goacDJJOaP0nihpo0A7gJkLHy2J8m3A3
 ucRPZeJUk88gBwIsq4pUVLKcOUlL95ZH+Umy7PjrJq2HQQKfjHd7Ym9Vf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="257286593"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="257286593"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 18:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="517968073"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 19 Mar 2022 18:39:52 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nVkXv-000GRt-Qc; Sun, 20 Mar 2022 01:39:51 +0000
Date: Sun, 20 Mar 2022 09:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 4/8] drm/i915/selftest_migrate: Check CCS
 meta data clear
Message-ID: <202203200912.4mqFVTe9-lkp@intel.com>
References: <20220319204229.9846-5-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319204229.9846-5-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>, kbuild-all@lists.01.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ramalingam,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm/drm-next drm-tip/drm-tip next-20220318]
[cannot apply to v5.17-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ramalingam-C/drm-i915-ttm-Evict-and-restore-of-compressed-object/20220320-044242
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220320/202203200912.4mqFVTe9-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/afd58bdbf43437bf72ff2313776c3036ebf99a11
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ramalingam-C/drm-i915-ttm-Evict-and-restore-of-compressed-object/20220320-044242
        git checkout afd58bdbf43437bf72ff2313776c3036ebf99a11
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:29,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:6,
                    from arch/x86/include/asm/processor.h:17,
                    from arch/x86/include/asm/kvm_para.h:5,
                    from arch/x86/include/asm/hypervisor.h:37,
                    from drivers/gpu/drm/i915/i915_drv.h:35,
                    from drivers/gpu/drm/i915/gt/intel_migrate.c:6:
   drivers/gpu/drm/i915/gt/selftest_migrate.c: In function 'clear':
>> include/linux/kern_levels.h:5:18: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Werror=format=]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/printk.h:418:11: note: in definition of macro 'printk_index_wrap'
     418 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |           ^~~~
   include/linux/printk.h:489:2: note: in expansion of macro 'printk'
     489 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR KERN_SOH "3" /* error conditions */
         |                  ^~~~~~~~
   include/linux/printk.h:489:9: note: in expansion of macro 'KERN_ERR'
     489 |  printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~
   drivers/gpu/drm/i915/gt/selftest_migrate.c:403:6: note: in expansion of macro 'pr_err'
     403 |      pr_err("%ps ccs clearing failed, offset: %d/%lu\n",
         |      ^~~~~~
   In file included from drivers/gpu/drm/i915/gt/intel_migrate.c:1014:
   drivers/gpu/drm/i915/gt/selftest_migrate.c:403:52: note: format string is defined here
     403 |      pr_err("%ps ccs clearing failed, offset: %d/%lu\n",
         |                                                  ~~^
         |                                                    |
         |                                                    long unsigned int
         |                                                  %u
   drivers/gpu/drm/i915/gt/intel_migrate.c: In function 'intel_context_copy_ccs':
>> drivers/gpu/drm/i915/gt/selftest_migrate.c:157:19: error: 'rq' is used uninitialized in this function [-Werror=uninitialized]
     157 |  offset += (u64)rq->engine->instance << 32;
         |                 ~~^~~~~~~~
   cc1: all warnings being treated as errors


vim +/rq +157 drivers/gpu/drm/i915/gt/selftest_migrate.c

   134	
   135	static int intel_context_copy_ccs(struct intel_context *ce,
   136					  const struct i915_deps *deps,
   137					  struct scatterlist *sg,
   138					  enum i915_cache_level cache_level,
   139					  bool write_to_ccs,
   140					  struct i915_request **out)
   141	{
   142		u8 src_access = write_to_ccs ? DIRECT_ACCESS : INDIRECT_ACCESS;
   143		u8 dst_access = write_to_ccs ? INDIRECT_ACCESS : DIRECT_ACCESS;
   144		struct sgt_dma it = sg_sgt(sg);
   145		struct i915_request *rq;
   146		u32 offset;
   147		int err;
   148	
   149		GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
   150		*out = NULL;
   151	
   152		GEM_BUG_ON(ce->ring->size < SZ_64K);
   153	
   154		offset = 0;
   155		if (HAS_64K_PAGES(ce->engine->i915))
   156			offset = CHUNK_SZ;
 > 157		offset += (u64)rq->engine->instance << 32;
   158	
   159		do {
   160			int len;
   161	
   162			rq = i915_request_create(ce);
   163			if (IS_ERR(rq)) {
   164				err = PTR_ERR(rq);
   165				goto out_ce;
   166			}
   167	
   168			if (deps) {
   169				err = i915_request_await_deps(rq, deps);
   170				if (err)
   171					goto out_rq;
   172	
   173				if (rq->engine->emit_init_breadcrumb) {
   174					err = rq->engine->emit_init_breadcrumb(rq);
   175					if (err)
   176						goto out_rq;
   177				}
   178	
   179				deps = NULL;
   180			}
   181	
   182			/* The PTE updates + clear must not be interrupted. */
   183			err = emit_no_arbitration(rq);
   184			if (err)
   185				goto out_rq;
   186	
   187			len = emit_pte(rq, &it, cache_level, true, offset, CHUNK_SZ);
   188			if (len <= 0) {
   189				err = len;
   190				goto out_rq;
   191			}
   192	
   193			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
   194			if (err)
   195				goto out_rq;
   196	
   197			err = emit_copy_ccs(rq, offset, dst_access,
   198					    offset, src_access, len);
   199			if (err)
   200				goto out_rq;
   201	
   202			err = rq->engine->emit_flush(rq, EMIT_INVALIDATE |
   203						     MI_FLUSH_DW_CCS);
   204	
   205			/* Arbitration is re-enabled between requests. */
   206	out_rq:
   207			if (*out)
   208				i915_request_put(*out);
   209			*out = i915_request_get(rq);
   210			i915_request_add(rq);
   211			if (err || !it.sg || !sg_dma_len(it.sg))
   212				break;
   213	
   214			cond_resched();
   215		} while (1);
   216	
   217	out_ce:
   218		return err;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
