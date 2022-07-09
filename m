Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F317B56C6F6
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 06:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7069B10F23D;
	Sat,  9 Jul 2022 04:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF18B10F23B;
 Sat,  9 Jul 2022 04:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657342106; x=1688878106;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=j49Dl39AT+z176fVip7dzCQx99mBMzB3KTwJY4xAhYE=;
 b=IRN/WnAJI9892i4Ra5ElOTb6SRudNeJ/+ncewL5oB4shAKkwN3Ian5rg
 LlCtc/L4PtgDgqQPwPrh5J3Mjq0Jkdo7QmFZ+ufrW6RdepyZ7Ef4PN6H4
 Opav0u26XA2P2wcNnSq8YGbwB6z/CUBuxlSdycrFKyKBuBeLnJ1dAe8au
 W4792wcthQwzrhQHjcjS9YikeHBx5YgLcdsNaT5EbihoaeR2q0K4XVigV
 emYSXSGJ/D23rFLnfe/GPxzg7P4PSyMi55u4ET12aLlv4zYGeKTl66ond
 ifVHO0+DtFu5G+SLBmIL3X2PpcTtibdxpBB88U1Y8qenw17hz6ibOGf7w g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="284429856"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="284429856"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 21:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="661983398"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 08 Jul 2022 21:48:23 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1oA2OF-000OJr-4v;
 Sat, 09 Jul 2022 04:48:23 +0000
Date: Sat, 9 Jul 2022 12:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [drm-tip:drm-tip 3/8]
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:512:28: error: passing argument
 1 of 'mutex_lock' from incompatible pointer type
Message-ID: <202207091259.WYfc1Mp6-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   36d2ac0e15af4dfb942279e8097ab831661859e6
commit: cf07f850c0483b3314eb69fd8c810e461cef4035 [3/8] Merge remote-tracking branch 'drm/drm-next' into drm-tip
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20220709/202207091259.WYfc1Mp6-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout cf07f850c0483b3314eb69fd8c810e461cef4035
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:28: note: in expansion of macro 'offsetof'
      22 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:25: note: in expansion of macro 'list_entry'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                         ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function 'amdgpu_vram_mgr_new':
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:488:13: error: 'cur_size' undeclared (first use in this function)
     488 |         if (cur_size != size) {
         |             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:488:13: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:488:25: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     488 |         if (cur_size != size) {
         |                         ^~~~
         |                         ksize
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:30: error: 'vres' undeclared (first use in this function); did you mean 'res'?
     494 |                 trim_list = &vres->blocks;
         |                              ^~~~
         |                              res
   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   include/linux/container_of.h:19:54: error: invalid use of undefined type 'struct drm_buddy_block'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:542:9: note: in expansion of macro 'list_entry'
     542 |         list_entry((ptr)->prev, type, member)
         |         ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:502:33: note: in expansion of macro 'list_last_entry'
     502 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
         |                                 ^~~~~~~~~~~~~~~
   include/linux/compiler_types.h:293:27: error: expression in static assertion is not an integer
     293 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:542:9: note: in expansion of macro 'list_entry'
     542 |         list_entry((ptr)->prev, type, member)
         |         ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:502:33: note: in expansion of macro 'list_last_entry'
     502 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
         |                                 ^~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/ia64/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/string.h:5,
                    from include/linux/dma-mapping.h:6,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct drm_buddy_block'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:28: note: in expansion of macro 'offsetof'
      22 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:542:9: note: in expansion of macro 'list_entry'
     542 |         list_entry((ptr)->prev, type, member)
         |         ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:502:33: note: in expansion of macro 'list_last_entry'
     502 |                         block = list_last_entry(&vres->blocks, typeof(*block), link);
         |                                 ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:503:46: error: invalid use of undefined type 'struct drm_buddy_block'
     503 |                         list_move_tail(&block->link, &temp);
         |                                              ^~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:512:28: error: passing argument 1 of 'mutex_lock' from incompatible pointer type [-Werror=incompatible-pointer-types]
     512 |                 mutex_lock(&mgr->lock);
         |                            ^~~~~~~~~~
         |                            |
         |                            spinlock_t * {aka struct spinlock *}
   In file included from include/linux/rhashtable-types.h:14,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   include/linux/mutex.h:199:38: note: expected 'struct mutex *' but argument is of type 'spinlock_t *' {aka 'struct spinlock *'}
     199 | extern void mutex_lock(struct mutex *lock);
         |                        ~~~~~~~~~~~~~~^~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:513:17: error: implicit declaration of function 'drm_buddy_block_trim' [-Werror=implicit-function-declaration]
     513 |                 drm_buddy_block_trim(mm,
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:516:30: error: passing argument 1 of 'mutex_unlock' from incompatible pointer type [-Werror=incompatible-pointer-types]
     516 |                 mutex_unlock(&mgr->lock);
         |                              ^~~~~~~~~~
         |                              |
         |                              spinlock_t * {aka struct spinlock *}
   In file included from include/linux/rhashtable-types.h:14,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   include/linux/mutex.h:218:40: note: expected 'struct mutex *' but argument is of type 'spinlock_t *' {aka 'struct spinlock *'}
     218 | extern void mutex_unlock(struct mutex *lock);
         |                          ~~~~~~~~~~~~~~^~~~
   In file included from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:523:29: error: 'block' undeclared (first use in this function); did you mean 'flock'?
     523 |         list_for_each_entry(block, &vres->blocks, link) {
         |                             ^~~~~
   include/linux/list.h:674:14: note: in definition of macro 'list_for_each_entry'
     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |              ^~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   include/linux/compiler_types.h:293:27: error: expression in static assertion is not an integer
     293 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:531:9: note: in expansion of macro 'list_entry'
     531 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:674:20: note: in expansion of macro 'list_first_entry'
     674 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:523:9: note: in expansion of macro 'list_for_each_entry'
     523 |         list_for_each_entry(block, &vres->blocks, link) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:293:27: error: expression in static assertion is not an integer
     293 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:19:23: note: in expansion of macro '__same_type'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:564:9: note: in expansion of macro 'list_entry'
     564 |         list_entry((pos)->member.next, typeof(*(pos)), member)


vim +/mutex_lock +512 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c

925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  384  
6a7f76e70fac0b Christian König          2016-08-24  385  /**
6a7f76e70fac0b Christian König          2016-08-24  386   * amdgpu_vram_mgr_new - allocate new ranges
6a7f76e70fac0b Christian König          2016-08-24  387   *
6a7f76e70fac0b Christian König          2016-08-24  388   * @man: TTM memory type manager
6a7f76e70fac0b Christian König          2016-08-24  389   * @tbo: TTM BO we need this range for
6a7f76e70fac0b Christian König          2016-08-24  390   * @place: placement flags and restrictions
6333a495f53347 Yifan Zhang              2021-08-26  391   * @res: the resulting mem object
6a7f76e70fac0b Christian König          2016-08-24  392   *
6a7f76e70fac0b Christian König          2016-08-24  393   * Allocate VRAM for the given BO.
6a7f76e70fac0b Christian König          2016-08-24  394   */
9de59bc201496f Dave Airlie              2020-08-04  395  static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
6a7f76e70fac0b Christian König          2016-08-24  396  			       struct ttm_buffer_object *tbo,
6a7f76e70fac0b Christian König          2016-08-24  397  			       const struct ttm_place *place,
cb1c81467af355 Christian König          2021-04-30  398  			       struct ttm_resource **res)
6a7f76e70fac0b Christian König          2016-08-24  399  {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  400  	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
0af135b892bf06 Dave Airlie              2020-08-04  401  	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
373627930f0208 Dave Airlie              2020-08-07  402  	struct amdgpu_device *adev = to_amdgpu_device(mgr);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  403  	uint64_t vis_usage = 0, mem_bytes, max_bytes;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  404  	struct ttm_range_mgr_node *node;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  405  	struct drm_mm *mm = &mgr->mm;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  406  	enum drm_mm_insert_mode mode;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  407  	unsigned i;
6a7f76e70fac0b Christian König          2016-08-24  408  	int r;
6a7f76e70fac0b Christian König          2016-08-24  409  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  410  	lpfn = place->lpfn;
6a7f76e70fac0b Christian König          2016-08-24  411  	if (!lpfn)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  412  		lpfn = man->size >> PAGE_SHIFT;
6a7f76e70fac0b Christian König          2016-08-24  413  
9d1b3c78052e87 Christian König          2019-08-30  414  	max_bytes = adev->gmc.mc_vram_size;
9d1b3c78052e87 Christian König          2019-08-30  415  	if (tbo->type != ttm_bo_type_kernel)
9d1b3c78052e87 Christian König          2019-08-30  416  		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
9d1b3c78052e87 Christian König          2019-08-30  417  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  418  	mem_bytes = tbo->base.size;
b4559a16467a13 Tom St Denis             2019-06-04  419  	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  420  		pages_per_node = ~0ul;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  421  		num_nodes = 1;
6a7f76e70fac0b Christian König          2016-08-24  422  	} else {
b4559a16467a13 Tom St Denis             2019-06-04  423  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  424  		pages_per_node = HPAGE_PMD_NR;
b4559a16467a13 Tom St Denis             2019-06-04  425  #else
b4559a16467a13 Tom St Denis             2019-06-04  426  		/* default to 2MB */
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  427  		pages_per_node = 2UL << (20UL - PAGE_SHIFT);
b4559a16467a13 Tom St Denis             2019-06-04  428  #endif
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  429  		pages_per_node = max_t(uint32_t, pages_per_node,
c777dc9e793342 Christian König          2021-02-05  430  				       tbo->page_alignment);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  431  		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
6a7f76e70fac0b Christian König          2016-08-24  432  	}
6a7f76e70fac0b Christian König          2016-08-24  433  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  434  	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  435  			GFP_KERNEL | __GFP_ZERO);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  436  	if (!node)
7db47b838896ec Christian König          2021-07-12  437  		return -ENOMEM;
6a7f76e70fac0b Christian König          2016-08-24  438  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  439  	ttm_resource_init(tbo, place, &node->base);
267501ec2b9cfa Christian König          2021-04-26  440  
7db47b838896ec Christian König          2021-07-12  441  	/* bail out quickly if there's likely not enough VRAM for this BO */
7db47b838896ec Christian König          2021-07-12  442  	if (ttm_resource_manager_usage(man) > max_bytes) {
7db47b838896ec Christian König          2021-07-12  443  		r = -ENOSPC;
7db47b838896ec Christian König          2021-07-12  444  		goto error_fini;
7db47b838896ec Christian König          2021-07-12  445  	}
7db47b838896ec Christian König          2021-07-12  446  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  447  	mode = DRM_MM_INSERT_BEST;
4e64e5539d152e Chris Wilson             2017-02-02  448  	if (place->flags & TTM_PL_FLAG_TOPDOWN)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  449  		mode = DRM_MM_INSERT_HIGH;
6a7f76e70fac0b Christian König          2016-08-24  450  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  451  	pages_left = node->base.num_pages;
6a7f76e70fac0b Christian König          2016-08-24  452  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  453  	/* Limit maximum size to 2GB due to SG table limitations */
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  454  	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
433ca054949a6c Christian König          2018-09-07  455  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  456  	i = 0;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  457  	spin_lock(&mgr->lock);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  458  	while (pages_left) {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  459  		uint32_t alignment = tbo->page_alignment;
6a7f76e70fac0b Christian König          2016-08-24  460  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  461  		if (pages >= pages_per_node)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  462  			alignment = pages_per_node;
6a7f76e70fac0b Christian König          2016-08-24  463  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  464  		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  465  						alignment, 0, place->fpfn,
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  466  						lpfn, mode);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  467  		if (unlikely(r)) {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  468  			if (pages > pages_per_node) {
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  469  				if (is_power_of_2(pages))
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  470  					pages = pages / 2;
dd03daec0ff170 Christian König          2021-04-26  471  				else
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  472  					pages = rounddown_pow_of_two(pages);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  473  				continue;
dd03daec0ff170 Christian König          2021-04-26  474  			}
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  475  			goto error_free;
6a7f76e70fac0b Christian König          2016-08-24  476  		}
6a7f76e70fac0b Christian König          2016-08-24  477  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  478  		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  479  		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  480  		pages_left -= pages;
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  481  		++i;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  482  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  483  		if (pages > pages_left)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  484  			pages = pages_left;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  485  	}
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  486  	spin_unlock(&mgr->lock);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  487  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  488  	if (cur_size != size) {
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  489  		struct drm_buddy_block *block;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  490  		struct list_head *trim_list;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  491  		u64 original_size;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  492  		LIST_HEAD(temp);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  493  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  494  		trim_list = &vres->blocks;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  495  		original_size = vres->base.num_pages << PAGE_SHIFT;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  496  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  497  		/*
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  498  		 * If size value is rounded up to min_block_size, trim the last
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  499  		 * block to the required size
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  500  		 */
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  501  		if (!list_is_singular(&vres->blocks)) {
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08 @502  			block = list_last_entry(&vres->blocks, typeof(*block), link);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  503  			list_move_tail(&block->link, &temp);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  504  			trim_list = &temp;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  505  			/*
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  506  			 * Compute the original_size value by subtracting the
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  507  			 * last block size with (aligned size - original size)
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  508  			 */
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  509  			original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
dd03daec0ff170 Christian König          2021-04-26  510  		}
6a7f76e70fac0b Christian König          2016-08-24  511  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08 @512  		mutex_lock(&mgr->lock);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  513  		drm_buddy_block_trim(mm,
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  514  				     original_size,
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  515  				     trim_list);
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  516  		mutex_unlock(&mgr->lock);
dd03daec0ff170 Christian König          2021-04-26  517  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  518  		if (!list_empty(&temp))
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  519  			list_splice_tail(trim_list, &vres->blocks);
6a7f76e70fac0b Christian König          2016-08-24  520  	}
6a7f76e70fac0b Christian König          2016-08-24  521  
5e3f1e7729ec7a Christian König          2022-05-10  522  	vres->base.start = 0;
5e3f1e7729ec7a Christian König          2022-05-10  523  	list_for_each_entry(block, &vres->blocks, link) {
5e3f1e7729ec7a Christian König          2022-05-10  524  		unsigned long start;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  525  
5e3f1e7729ec7a Christian König          2022-05-10  526  		start = amdgpu_vram_mgr_block_start(block) +
5e3f1e7729ec7a Christian König          2022-05-10  527  			amdgpu_vram_mgr_block_size(block);
5e3f1e7729ec7a Christian König          2022-05-10  528  		start >>= PAGE_SHIFT;
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  529  
5e3f1e7729ec7a Christian König          2022-05-10  530  		if (start > vres->base.num_pages)
5e3f1e7729ec7a Christian König          2022-05-10  531  			start -= vres->base.num_pages;
5e3f1e7729ec7a Christian König          2022-05-10  532  		else
5e3f1e7729ec7a Christian König          2022-05-10  533  			start = 0;
5e3f1e7729ec7a Christian König          2022-05-10  534  		vres->base.start = max(vres->base.start, start);
5e3f1e7729ec7a Christian König          2022-05-10  535  
5e3f1e7729ec7a Christian König          2022-05-10  536  		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
5e3f1e7729ec7a Christian König          2022-05-10  537  	}
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  538  
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  539  	if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
c9cad937c0c586 Arunpravin Paneer Selvam 2022-04-08  540  		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
3c848bb38aca1f Christian König          2017-08-07  541  
8dbe43e99f0f62 Oak Zeng                 2021-06-28  542  	if (adev->gmc.xgmi.connected_to_cpu)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  543  		node->base.bus.caching = ttm_cached;
8dbe43e99f0f62 Oak Zeng                 2021-06-28  544  	else
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  545  		node->base.bus.caching = ttm_write_combined;
8dbe43e99f0f62 Oak Zeng                 2021-06-28  546  
abf91e0d33166b Christian König          2021-04-27  547  	atomic64_add(vis_usage, &mgr->vis_usage);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  548  	*res = &node->base;
6a7f76e70fac0b Christian König          2016-08-24  549  	return 0;
6a7f76e70fac0b Christian König          2016-08-24  550  
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  551  error_free:
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  552  	while (i--)
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  553  		drm_mm_remove_node(&node->mm_nodes[i]);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  554  	spin_unlock(&mgr->lock);
7db47b838896ec Christian König          2021-07-12  555  error_fini:
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  556  	ttm_resource_fini(man, &node->base);
925b6e59138cef Arunpravin Paneer Selvam 2022-07-08  557  	kvfree(node);
6a7f76e70fac0b Christian König          2016-08-24  558  
58e4d686d456c3 Christian König          2020-06-16  559  	return r;
6a7f76e70fac0b Christian König          2016-08-24  560  }
6a7f76e70fac0b Christian König          2016-08-24  561  

:::::: The code at line 512 was first introduced by commit
:::::: c9cad937c0c58618fe5b0310fd539a854dc1ae95 drm/amdgpu: add drm buddy support to amdgpu

:::::: TO: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
:::::: CC: Christian König <christian.koenig@amd.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
