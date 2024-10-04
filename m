Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7EC990B87
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B335410EA77;
	Fri,  4 Oct 2024 18:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/DxQRTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CDF10EA77;
 Fri,  4 Oct 2024 18:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728066640; x=1759602640;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eeH+AH7u2w9KHWUrQx32pxEJ3OAjsgyXvB5ZIdY/G60=;
 b=h/DxQRTPy47LxHsHci1CAltvSSDtd0z7dyDfX4LR73avUH53XR0TBHHM
 4QZWK/1kkBuXUuwIXhb0NxSx/DgIWGHN3HliagN8onO3RDoQouIrBOSUJ
 goGQdXT3XZj3+bM/BdBAeFzjV8otJmXOdV0tDiXqDXE/h3/MswIekFpyw
 6L0wmoPXnen9pHfmESiG/irs8Gr2nnENnnnlVa/ST9qGz80j3sv1wbHSN
 qmXn4ktxBK+52jNtAvxzPqBAAN3+KIik7cTSuL12TLDWtP3V3WZDh1ueX
 rvUZcIMzWiP/vSHAOVf2AV4x+dVwRANSbA4p8R5MS/CXDxOtXAI/THD0f g==;
X-CSE-ConnectionGUID: NUmiN1TbTLibuPBU1mZRBQ==
X-CSE-MsgGUID: gG1So69lRva1P4W+Kg3CMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="26806336"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="26806336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 11:30:37 -0700
X-CSE-ConnectionGUID: WsqR+Qe/Q5aGyQuIS10OQA==
X-CSE-MsgGUID: riEHNx/gROWhm0lv4CoFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="79749459"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa004.jf.intel.com with ESMTP; 04 Oct 2024 11:30:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1swn4S-00024Q-0N;
 Fri, 04 Oct 2024 18:30:32 +0000
Date: Sat, 5 Oct 2024 02:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 03/11] drm/fbdev: Select fbdev I/O helpers from
 modules that require them
Message-ID: <202410050241.Mox9QRjP-lkp@intel.com>
References: <20241002131306.288618-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002131306.288618-4-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20241002]
[also build test ERROR on v6.12-rc1]
[cannot apply to drm-xe/drm-xe-next drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.12-rc1 v6.11 v6.11-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-i915-Select-DRM_CLIENT_SELECTION/20241002-211520
base:   next-20241002
patch link:    https://lore.kernel.org/r/20241002131306.288618-4-tzimmermann%40suse.de
patch subject: [PATCH v2 03/11] drm/fbdev: Select fbdev I/O helpers from modules that require them
config: arm-aspeed_g5_defconfig (https://download.01.org/0day-ci/archive/20241005/202410050241.Mox9QRjP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050241.Mox9QRjP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050241.Mox9QRjP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_fbdev_dma.c: In function 'drm_fbdev_dma_driver_fbdev_probe':
>> drivers/gpu/drm/drm_fbdev_dma.c:218:26: error: 'struct drm_fb_helper' has no member named 'fbdefio'
     218 |                 fb_helper->fbdefio.delay = HZ / 20;
         |                          ^~
   drivers/gpu/drm/drm_fbdev_dma.c:219:26: error: 'struct drm_fb_helper' has no member named 'fbdefio'
     219 |                 fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
         |                          ^~
>> drivers/gpu/drm/drm_fbdev_dma.c:221:21: error: 'struct fb_info' has no member named 'fbdefio'
     221 |                 info->fbdefio = &fb_helper->fbdefio;
         |                     ^~
   drivers/gpu/drm/drm_fbdev_dma.c:221:43: error: 'struct drm_fb_helper' has no member named 'fbdefio'
     221 |                 info->fbdefio = &fb_helper->fbdefio;
         |                                           ^~
--
   In file included from include/linux/bitfield.h:10,
                    from arch/arm/include/asm/ptrace.h:13,
                    from arch/arm/include/asm/processor.h:14,
                    from include/linux/prefetch.h:15,
                    from arch/arm/include/asm/atomic.h:12,
                    from include/linux/atomic.h:7,
                    from include/linux/console.h:17,
                    from drivers/gpu/drm/drm_fb_helper.c:32:
   drivers/gpu/drm/drm_fb_helper.c: In function 'drm_fb_helper_deferred_io':
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/atomic.h:5:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:778:20: note: in expansion of macro 'list_first_entry'
     778 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/include/asm/traps.h:6,
                    from arch/arm/include/asm/thread_info.h:43,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rcuwait.h:5,
                    from include/linux/irq_work.h:6,
                    from include/linux/console.h:19:
>> include/linux/list.h:769:26: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
     769 |         list_is_head(&pos->member, (head))
         |                          ^~
   include/linux/list.h:779:15: note: in expansion of macro 'list_entry_is_head'
     779 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/llist.h:52,
                    from include/linux/smp_types.h:5,
                    from include/linux/irq_work.h:5:
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:458:27: error: expression in static assertion is not an integer
     458 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:780:20: note: in expansion of macro 'list_next_entry'
     780 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_fb_helper.c:717:9: note: in expansion of macro 'list_for_each_entry'
     717 |         list_for_each_entry(pageref, pagereflist, list) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_fb_helper.c:718:32: error: invalid use of undefined type 'struct fb_deferred_io_pageref'
     718 |                 start = pageref->offset;
         |                                ^~


vim +218 drivers/gpu/drm/drm_fbdev_dma.c

8998eedda2539d Thomas Zimmermann 2024-09-24  125  
8998eedda2539d Thomas Zimmermann 2024-09-24  126  /*
8998eedda2539d Thomas Zimmermann 2024-09-24  127   * struct drm_fb_helper
8998eedda2539d Thomas Zimmermann 2024-09-24  128   */
8998eedda2539d Thomas Zimmermann 2024-09-24  129  
8998eedda2539d Thomas Zimmermann 2024-09-24  130  int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
8998eedda2539d Thomas Zimmermann 2024-09-24  131  				     struct drm_fb_helper_surface_size *sizes)
b79fe9abd58bab Thomas Zimmermann 2023-03-13  132  {
b79fe9abd58bab Thomas Zimmermann 2023-03-13  133  	struct drm_client_dev *client = &fb_helper->client;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  134  	struct drm_device *dev = fb_helper->dev;
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  135  	bool use_deferred_io = false;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  136  	struct drm_client_buffer *buffer;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  137  	struct drm_gem_dma_object *dma_obj;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  138  	struct drm_framebuffer *fb;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  139  	struct fb_info *info;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  140  	u32 format;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  141  	struct iosys_map map;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  142  	int ret;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  143  
b79fe9abd58bab Thomas Zimmermann 2023-03-13  144  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
b79fe9abd58bab Thomas Zimmermann 2023-03-13  145  		    sizes->surface_width, sizes->surface_height,
b79fe9abd58bab Thomas Zimmermann 2023-03-13  146  		    sizes->surface_bpp);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  147  
cb31c58e8c294f Thomas Huth       2024-07-02  148  	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
cb31c58e8c294f Thomas Huth       2024-07-02  149  					     sizes->surface_depth);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  150  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
b79fe9abd58bab Thomas Zimmermann 2023-03-13  151  					       sizes->surface_height, format);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  152  	if (IS_ERR(buffer))
b79fe9abd58bab Thomas Zimmermann 2023-03-13  153  		return PTR_ERR(buffer);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  154  	dma_obj = to_drm_gem_dma_obj(buffer->gem);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  155  
b79fe9abd58bab Thomas Zimmermann 2023-03-13  156  	fb = buffer->fb;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  157  
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  158  	/*
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  159  	 * Deferred I/O requires struct page for framebuffer memory,
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  160  	 * which is not guaranteed for all DMA ranges. We thus only
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  161  	 * install deferred I/O if we have a framebuffer that requires
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  162  	 * it.
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  163  	 */
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  164  	if (fb->funcs->dirty)
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  165  		use_deferred_io = true;
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  166  
b79fe9abd58bab Thomas Zimmermann 2023-03-13  167  	ret = drm_client_buffer_vmap(buffer, &map);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  168  	if (ret) {
b79fe9abd58bab Thomas Zimmermann 2023-03-13  169  		goto err_drm_client_buffer_delete;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  170  	} else if (drm_WARN_ON(dev, map.is_iomem)) {
b79fe9abd58bab Thomas Zimmermann 2023-03-13  171  		ret = -ENODEV; /* I/O memory not supported; use generic emulation */
b79fe9abd58bab Thomas Zimmermann 2023-03-13  172  		goto err_drm_client_buffer_delete;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  173  	}
b79fe9abd58bab Thomas Zimmermann 2023-03-13  174  
8998eedda2539d Thomas Zimmermann 2024-09-24  175  	fb_helper->funcs = &drm_fbdev_dma_helper_funcs;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  176  	fb_helper->buffer = buffer;
808a40b6946804 Thomas Zimmermann 2024-04-19  177  	fb_helper->fb = fb;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  178  
b79fe9abd58bab Thomas Zimmermann 2023-03-13  179  	info = drm_fb_helper_alloc_info(fb_helper);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  180  	if (IS_ERR(info)) {
b79fe9abd58bab Thomas Zimmermann 2023-03-13  181  		ret = PTR_ERR(info);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  182  		goto err_drm_client_buffer_vunmap;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  183  	}
b79fe9abd58bab Thomas Zimmermann 2023-03-13  184  
b79fe9abd58bab Thomas Zimmermann 2023-03-13  185  	drm_fb_helper_fill_info(info, fb_helper, sizes);
b79fe9abd58bab Thomas Zimmermann 2023-03-13  186  
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  187  	if (use_deferred_io)
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  188  		info->fbops = &drm_fbdev_dma_deferred_fb_ops;
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  189  	else
b79fe9abd58bab Thomas Zimmermann 2023-03-13  190  		info->fbops = &drm_fbdev_dma_fb_ops;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  191  
b79fe9abd58bab Thomas Zimmermann 2023-03-13  192  	/* screen */
b79fe9abd58bab Thomas Zimmermann 2023-03-13  193  	info->flags |= FBINFO_VIRTFB; /* system memory */
b79fe9abd58bab Thomas Zimmermann 2023-03-13  194  	if (dma_obj->map_noncoherent)
b79fe9abd58bab Thomas Zimmermann 2023-03-13  195  		info->flags |= FBINFO_READS_FAST; /* signal caching */
b79fe9abd58bab Thomas Zimmermann 2023-03-13  196  	info->screen_size = sizes->surface_height * fb->pitches[0];
b79fe9abd58bab Thomas Zimmermann 2023-03-13  197  	info->screen_buffer = map.vaddr;
d92a7580392ad4 Thomas Zimmermann 2024-06-17  198  	if (!(info->flags & FBINFO_HIDE_SMEM_START)) {
d92a7580392ad4 Thomas Zimmermann 2024-06-17  199  		if (!drm_WARN_ON(dev, is_vmalloc_addr(info->screen_buffer)))
b79fe9abd58bab Thomas Zimmermann 2023-03-13  200  			info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
d92a7580392ad4 Thomas Zimmermann 2024-06-17  201  	}
a51c7663f14460 Thomas Zimmermann 2023-03-20  202  	info->fix.smem_len = info->screen_size;
b79fe9abd58bab Thomas Zimmermann 2023-03-13  203  
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  204  	/*
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  205  	 * Only set up deferred I/O if the screen buffer supports
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  206  	 * it. If this disagrees with the previous test for ->dirty,
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  207  	 * mmap on the /dev/fb file might not work correctly.
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  208  	 */
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  209  	if (!is_vmalloc_addr(info->screen_buffer) && info->fix.smem_start) {
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  210  		unsigned long pfn = info->fix.smem_start >> PAGE_SHIFT;
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  211  
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  212  		if (drm_WARN_ON(dev, !pfn_to_page(pfn)))
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  213  			use_deferred_io = false;
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  214  	}
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  215  
808a40b6946804 Thomas Zimmermann 2024-04-19  216  	/* deferred I/O */
5a498d4d06d6d9 Thomas Zimmermann 2024-09-04  217  	if (use_deferred_io) {
808a40b6946804 Thomas Zimmermann 2024-04-19 @218  		fb_helper->fbdefio.delay = HZ / 20;
808a40b6946804 Thomas Zimmermann 2024-04-19  219  		fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
808a40b6946804 Thomas Zimmermann 2024-04-19  220  
808a40b6946804 Thomas Zimmermann 2024-04-19 @221  		info->fbdefio = &fb_helper->fbdefio;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
