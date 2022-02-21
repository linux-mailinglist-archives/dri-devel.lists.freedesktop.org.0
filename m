Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23AD4BEE5E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1595910E562;
	Mon, 21 Feb 2022 23:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E8F10E561;
 Mon, 21 Feb 2022 23:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645486910; x=1677022910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zPiVt7qLwbT6nB0jKSQdDpJT674lr4cYd2X+OAPFFyo=;
 b=Kjttoiv4+bSjKT5AixljLuxb4uHLc8NhTbkfant+ZLtarpg4UC2L9CAn
 kwgF2Tyu8NFgwoAaoGKS1s+jog+LOFok5XgwfWV/izn+jG2eXu87OZlK2
 km7KcV01blNLEUP+5/aq6rdMP3l4HEXe20m4P0PdT1w+/Ou1tg6YLJuvs
 qzOQ86IeqGOY2Pc7N8OPLdQ81Ch56dAYEMC1phcyE1blS41atzNcbFul8
 2Px4z6SBZX3qiRQoc/kkRkpgvAKNzFT2cvzq89d1PB2Tua/Cq8HNBHqcO
 6CXD9NWNOawIt3ffXhIlKtsC6K1e+DN62V4oSJ5eXckVXLCd/zGJNDnau A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250401933"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="250401933"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="591103571"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 21 Feb 2022 15:41:45 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nMIJN-00025T-1D; Mon, 21 Feb 2022 23:41:45 +0000
Date: Tue, 22 Feb 2022 07:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yongzhi Liu <lyz_cs@pku.edu.cn>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com, matthew.d.roper@intel.com,
 tzimmermann@suse.de, michal.winiarski@intel.com
Subject: Re: [PATCH] drm/i915: Check input parameter for NULL
Message-ID: <202202220722.25BhJJ6r-lkp@intel.com>
References: <1645455221-38580-1-git-send-email-lyz_cs@pku.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645455221-38580-1-git-send-email-lyz_cs@pku.edu.cn>
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yongzhi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yongzhi-Liu/drm-i915-Check-input-parameter-for-NULL/20220221-225508
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: i386-randconfig-a014-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220722.25BhJJ6r-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c54be425a38b3f4cb82c5badecf6b343f9e24a90
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yongzhi-Liu/drm-i915-Check-input-parameter-for-NULL/20220221-225508
        git checkout c54be425a38b3f4cb82c5badecf6b343f9e24a90
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gem/i915_gem_phys.c:100:13: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
           dma_addr_t dma = sg_dma_address(pages->sgl);
                      ^
   1 warning generated.


vim +100 drivers/gpu/drm/i915/gem/i915_gem_phys.c

f033428db28bdf Chris Wilson      2019-05-28   93  
a61170975718d5 Maarten Lankhorst 2021-03-23   94  void
f033428db28bdf Chris Wilson      2019-05-28   95  i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
f033428db28bdf Chris Wilson      2019-05-28   96  			       struct sg_table *pages)
f033428db28bdf Chris Wilson      2019-05-28   97  {
c54be425a38b3f Yongzhi Liu       2022-02-21   98  	if (!pages)
c54be425a38b3f Yongzhi Liu       2022-02-21   99  		return;
c6790dc22312f5 Chris Wilson      2020-02-02 @100  	dma_addr_t dma = sg_dma_address(pages->sgl);
c6790dc22312f5 Chris Wilson      2020-02-02  101  	void *vaddr = sg_page(pages->sgl);
c6790dc22312f5 Chris Wilson      2020-02-02  102  
f033428db28bdf Chris Wilson      2019-05-28  103  	__i915_gem_object_release_shmem(obj, pages, false);
f033428db28bdf Chris Wilson      2019-05-28  104  
f033428db28bdf Chris Wilson      2019-05-28  105  	if (obj->mm.dirty) {
f033428db28bdf Chris Wilson      2019-05-28  106  		struct address_space *mapping = obj->base.filp->f_mapping;
c6790dc22312f5 Chris Wilson      2020-02-02  107  		void *src = vaddr;
f033428db28bdf Chris Wilson      2019-05-28  108  		int i;
f033428db28bdf Chris Wilson      2019-05-28  109  
f033428db28bdf Chris Wilson      2019-05-28  110  		for (i = 0; i < obj->base.size / PAGE_SIZE; i++) {
f033428db28bdf Chris Wilson      2019-05-28  111  			struct page *page;
f033428db28bdf Chris Wilson      2019-05-28  112  			char *dst;
f033428db28bdf Chris Wilson      2019-05-28  113  
f033428db28bdf Chris Wilson      2019-05-28  114  			page = shmem_read_mapping_page(mapping, i);
f033428db28bdf Chris Wilson      2019-05-28  115  			if (IS_ERR(page))
f033428db28bdf Chris Wilson      2019-05-28  116  				continue;
f033428db28bdf Chris Wilson      2019-05-28  117  
f033428db28bdf Chris Wilson      2019-05-28  118  			dst = kmap_atomic(page);
c6790dc22312f5 Chris Wilson      2020-02-02  119  			drm_clflush_virt_range(src, PAGE_SIZE);
c6790dc22312f5 Chris Wilson      2020-02-02  120  			memcpy(dst, src, PAGE_SIZE);
f033428db28bdf Chris Wilson      2019-05-28  121  			kunmap_atomic(dst);
f033428db28bdf Chris Wilson      2019-05-28  122  
f033428db28bdf Chris Wilson      2019-05-28  123  			set_page_dirty(page);
f033428db28bdf Chris Wilson      2019-05-28  124  			if (obj->mm.madv == I915_MADV_WILLNEED)
f033428db28bdf Chris Wilson      2019-05-28  125  				mark_page_accessed(page);
f033428db28bdf Chris Wilson      2019-05-28  126  			put_page(page);
c6790dc22312f5 Chris Wilson      2020-02-02  127  
c6790dc22312f5 Chris Wilson      2020-02-02  128  			src += PAGE_SIZE;
f033428db28bdf Chris Wilson      2019-05-28  129  		}
f033428db28bdf Chris Wilson      2019-05-28  130  		obj->mm.dirty = false;
f033428db28bdf Chris Wilson      2019-05-28  131  	}
f033428db28bdf Chris Wilson      2019-05-28  132  
f033428db28bdf Chris Wilson      2019-05-28  133  	sg_free_table(pages);
f033428db28bdf Chris Wilson      2019-05-28  134  	kfree(pages);
f033428db28bdf Chris Wilson      2019-05-28  135  
8ff5446a7ca47c Thomas Zimmermann 2021-01-28  136  	dma_free_coherent(obj->base.dev->dev,
c6790dc22312f5 Chris Wilson      2020-02-02  137  			  roundup_pow_of_two(obj->base.size),
c6790dc22312f5 Chris Wilson      2020-02-02  138  			  vaddr, dma);
f033428db28bdf Chris Wilson      2019-05-28  139  }
f033428db28bdf Chris Wilson      2019-05-28  140  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
