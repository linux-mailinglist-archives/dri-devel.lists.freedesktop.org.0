Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FD56C5B7
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 03:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A5410E35F;
	Sat,  9 Jul 2022 01:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266C210E35F;
 Sat,  9 Jul 2022 01:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657329919; x=1688865919;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ToGIrpaik+FfnS+EUjmOmYrL8k1OnurM1lQ2zt15+nA=;
 b=Q6TJ6orDM2EJa+M7zMlSfvxcR0q9rvFRF7WR9feMI/RP5J6k42BwMQQf
 8B3rKIA9S+InMAfn3pgLeOBKSPCvcsj5iAtCLuqgRWFJCBYLhU+VpNeqm
 OEtj4+S82Fygpvzkw3EkgMVF4S4bZl5fmvaLm/VTfbVu5Yq411WHhlWjl
 fIfqb4a5aC1O4wFvNPxdsN8AccdghoAYJqu98TOw9o0/mFQurGs/QDG1u
 DpQFvQ/SWdxdTVEiwgzDqlECoGsVPGnCWK1nUND4fHQqD03JgG7OcM2Gj
 tctXC15YOE40AmwEYA7gNnDddqqWJ6RyBPO09RnV4YDtATa+eLQTk0X4K w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="370707075"
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="370707075"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 18:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; d="scan'208";a="594303042"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 08 Jul 2022 18:25:15 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o9zDe-000O8a-Uf;
 Sat, 09 Jul 2022 01:25:14 +0000
Date: Sat, 9 Jul 2022 09:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [drm-tip:drm-tip 3/8] include/linux/container_of.h:19:54: error:
 invalid use of undefined type 'struct drm_buddy_block'
Message-ID: <202207090946.Xujb0GPO-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
config: microblaze-randconfig-r011-20220707 (https://download.01.org/0day-ci/archive/20220709/202207090946.Xujb0GPO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-tip git://anongit.freedesktop.org/drm/drm-tip
        git fetch --no-tags drm-tip drm-tip
        git checkout cf07f850c0483b3314eb69fd8c810e461cef4035
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function 'amdgpu_vram_mgr_first_block':
>> include/linux/container_of.h:19:54: error: invalid use of undefined type 'struct drm_buddy_block'
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
   include/linux/list.h:555:27: note: in expansion of macro 'list_entry'
     555 |         pos__ != head__ ? list_entry(pos__, type, member) : NULL; \
         |                           ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:54:16: note: in expansion of macro 'list_first_entry_or_null'
      54 |         return list_first_entry_or_null(list, struct drm_buddy_block, link);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
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
   include/linux/list.h:555:27: note: in expansion of macro 'list_entry'
     555 |         pos__ != head__ ? list_entry(pos__, type, member) : NULL; \
         |                           ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:54:16: note: in expansion of macro 'list_first_entry_or_null'
      54 |         return list_first_entry_or_null(list, struct drm_buddy_block, link);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/microblaze/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/string.h:5,
                    from include/linux/dma-mapping.h:6,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct drm_buddy_block'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:22:28: note: in expansion of macro 'offsetof'
      22 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:555:27: note: in expansion of macro 'list_entry'
     555 |         pos__ != head__ ? list_entry(pos__, type, member) : NULL; \
         |                           ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:54:16: note: in expansion of macro 'list_first_entry_or_null'
      54 |         return list_first_entry_or_null(list, struct drm_buddy_block, link);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c: In function 'amdgpu_is_vram_mgr_blocks_contiguous':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:66:29: error: invalid use of undefined type 'struct drm_buddy_block'
      66 |         while (head != block->link.next) {
         |                             ^~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:67:25: error: implicit declaration of function 'amdgpu_vram_mgr_block_start'; did you mean 'amdgpu_vram_mgr_alloc_sgt'? [-Werror=implicit-function-declaration]
      67 |                 start = amdgpu_vram_mgr_block_start(block);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         amdgpu_vram_mgr_alloc_sgt
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:68:24: error: implicit declaration of function 'amdgpu_vram_mgr_block_size'; did you mean 'amdgpu_vram_mgr_alloc_sgt'? [-Werror=implicit-function-declaration]
      68 |                 size = amdgpu_vram_mgr_block_size(block);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        amdgpu_vram_mgr_alloc_sgt
   In file included from include/linux/list.h:5,
                    from include/linux/rculist.h:10,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:41: error: invalid use of undefined type 'struct drm_buddy_block'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                                         ^~
   include/linux/container_of.h:18:33: note: in definition of macro 'container_of'
      18 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:25: note: in expansion of macro 'list_entry'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                         ^~~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:41: error: invalid use of undefined type 'struct drm_buddy_block'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                                         ^~
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:25: note: in expansion of macro 'list_entry'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                         ^~~~~~~~~~
>> include/linux/container_of.h:19:54: error: invalid use of undefined type 'struct drm_buddy_block'
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:25: note: in expansion of macro 'list_entry'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                         ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:41: error: invalid use of undefined type 'struct drm_buddy_block'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:19:9: note: in expansion of macro 'static_assert'
      19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:25: note: in expansion of macro 'list_entry'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                         ^~~~~~~~~~
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
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:70:25: note: in expansion of macro 'list_entry'
      70 |                 block = list_entry(block->link.next, struct drm_buddy_block, link);
         |                         ^~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/microblaze/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/string.h:5,
                    from include/linux/dma-mapping.h:6,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct drm_buddy_block'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
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
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:488:13: error: 'cur_size' undeclared (first use in this function)
     488 |         if (cur_size != size) {
         |             ^~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:488:13: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:488:25: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     488 |         if (cur_size != size) {
         |                         ^~~~
         |                         ksize
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:494:30: error: 'vres' undeclared (first use in this function); did you mean 'res'?
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
>> include/linux/container_of.h:19:54: error: invalid use of undefined type 'struct drm_buddy_block'
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
                    from ./arch/microblaze/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:248,
                    from include/linux/string.h:5,
                    from include/linux/dma-mapping.h:6,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct drm_buddy_block'
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
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:512:28: error: passing argument 1 of 'mutex_lock_nested' from incompatible pointer type [-Werror=incompatible-pointer-types]
     512 |                 mutex_lock(&mgr->lock);
         |                            ^~~~~~~~~~
         |                            |
         |                            spinlock_t * {aka struct spinlock *}
   include/linux/mutex.h:187:44: note: in definition of macro 'mutex_lock'
     187 | #define mutex_lock(lock) mutex_lock_nested(lock, 0)
         |                                            ^~~~
   include/linux/mutex.h:178:45: note: expected 'struct mutex *' but argument is of type 'spinlock_t *' {aka 'struct spinlock *'}
     178 | extern void mutex_lock_nested(struct mutex *lock, unsigned int subclass);
         |                               ~~~~~~~~~~~~~~^~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:513:17: error: implicit declaration of function 'drm_buddy_block_trim' [-Werror=implicit-function-declaration]
     513 |                 drm_buddy_block_trim(mm,
         |                 ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:516:30: error: passing argument 1 of 'mutex_unlock' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:523:29: error: 'block' undeclared (first use in this function); did you mean 'flock'?
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
         |         ^~~~~~~~~~
   include/linux/list.h:676:20: note: in expansion of macro 'list_next_entry'
     676 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:523:9: note: in expansion of macro 'list_for_each_entry'
     523 |         list_for_each_entry(block, &vres->blocks, link) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:26,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:7,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:25:
>> include/linux/minmax.h:36:9: error: first argument to '__builtin_choose_expr' not a constant
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:52:25: note: in expansion of macro '__careful_cmp'
      52 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:534:36: note: in expansion of macro 'max'
     534 |                 vres->base.start = max(vres->base.start, start);
         |                                    ^~~
   cc1: some warnings being treated as errors


vim +19 include/linux/container_of.h

d2a8ebbf8192b84 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  15   *
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  16   */
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  17  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  18  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6dfb Rasmus Villemoes 2021-11-08 @19  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6dfb Rasmus Villemoes 2021-11-08  20  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  21  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  22  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b84 Andy Shevchenko  2021-11-08  23  

:::::: The code at line 19 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
