Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A45CAE310
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 22:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69C710E195;
	Mon,  8 Dec 2025 21:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIXMT27g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6B710E081;
 Mon,  8 Dec 2025 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765228030; x=1796764030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BuyRWD+gYUtKR6SNm6SbZ1nyAAJ0j0jKNpYO74bLaZs=;
 b=cIXMT27gKiwyELF6RGm3Z0WTh2dz4PvX1RWa2Q0n9N2Z4yrUhaOw9k2Y
 4z88duvE75wwhi/rrDMwe6MPsinjsYsSJIMoSbHFkgjBXjReHrRwnbfK9
 dxzClye+Z6MwdVPKMNcDgETT0kHH2etqHhPnJgc7jzoj8dpR409XRLQRI
 EOaH9RfM/md3ctM5/LIEaUtwg0eJbd5afmRfuQFjsJvhXDNWMw6Ih5Nni
 kuWhCM8nZalCrbxKBNAsygYMw2Ws2XrKQR8/TaGfe+XcxpsNetlh5DhdR
 GtI4bbLZ8BgEnyc0UeiUT5uTk8sXpaNGcudaGfqwYkxDRM1HMYAfkL5xW Q==;
X-CSE-ConnectionGUID: ynRR88hsRpyqXGhJmB2DrA==
X-CSE-MsgGUID: 0jEz508cRK+iMkruqIVhug==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="78537975"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="78537975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 13:07:09 -0800
X-CSE-ConnectionGUID: nqvnXMV+QuGTrbufrDzEvg==
X-CSE-MsgGUID: rY5KH2wbQLi8ATprmTz0Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; d="scan'208";a="200204397"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 13:07:06 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vSiRj-000000000qf-3KaN;
 Mon, 08 Dec 2025 21:07:03 +0000
Date: Tue, 9 Dec 2025 05:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] video/vga: Add VGA_IS0_R
Message-ID: <202512090434.DRy1Kvan-lkp@intel.com>
References: <20251208182637.334-15-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208182637.334-15-ville.syrjala@linux.intel.com>
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

Hi Ville,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.18 next-20251208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-vga-Register-vgaarb-client-later/20251209-030730
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251208182637.334-15-ville.syrjala%40linux.intel.com
patch subject: [PATCH 14/19] video/vga: Add VGA_IS0_R
config: microblaze-randconfig-r072-20251209 (https://download.01.org/0day-ci/archive/20251209/202512090434.DRy1Kvan-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090434.DRy1Kvan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090434.DRy1Kvan-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/vgaarb.h:15,
                    from drivers/video/aperture.c:12:
>> include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   In file included from drivers/video/aperture.c:14:
>> include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   drivers/video/aperture.c: In function 'devm_aperture_acquire_release':
>> drivers/video/aperture.c:153:21: error: dereferencing pointer to incomplete type 'struct aperture_range'
     bool detached = !ap->dev;
                        ^~
   In file included from include/linux/bits.h:30,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/video/aperture.c:4:
   drivers/video/aperture.c: In function 'devm_aperture_acquire':
>> include/linux/container_of.h:21:47: error: dereferencing pointer to incomplete type 'struct aperture_range'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/video/aperture.c:174:8: note: in expansion of macro 'container_of'
      ap = container_of(pos, struct aperture_range, lh);
           ^~~~~~~~~~~~
   include/linux/compiler_types.h:537:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/video/aperture.c:174:8: note: in expansion of macro 'container_of'
      ap = container_of(pos, struct aperture_range, lh);
           ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/aperture.h:6,
                    from drivers/video/aperture.c:3:
>> include/linux/stddef.h:16:32: error: invalid use of undefined type 'struct aperture_range'
    #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: in expansion of macro 'offsetof'
     ((type *)(__mptr - offsetof(type, member))); })
                        ^~~~~~~~
   drivers/video/aperture.c:174:8: note: in expansion of macro 'container_of'
      ap = container_of(pos, struct aperture_range, lh);
           ^~~~~~~~~~~~
   In file included from include/linux/bits.h:30,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/video/aperture.c:4:
   drivers/video/aperture.c: In function 'aperture_detach_devices':
>> include/linux/container_of.h:21:47: error: dereferencing pointer to incomplete type 'struct aperture_range'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                                                  ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/video/aperture.c:255:31: note: in expansion of macro 'container_of'
      struct aperture_range *ap = container_of(pos, struct aperture_range, lh);
                                  ^~~~~~~~~~~~
   include/linux/compiler_types.h:537:27: error: expression in static assertion is not an integer
    #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
    #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                           ^~~~
   include/linux/container_of.h:21:2: note: in expansion of macro 'static_assert'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
     ^~~~~~~~~~~~~
   include/linux/container_of.h:21:16: note: in expansion of macro '__same_type'
     static_assert(__same_type(*(ptr), ((type *)0)->member) || \
                   ^~~~~~~~~~~
   drivers/video/aperture.c:255:31: note: in expansion of macro 'container_of'
      struct aperture_range *ap = container_of(pos, struct aperture_range, lh);
                                  ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/aperture.h:6,
                    from drivers/video/aperture.c:3:
>> include/linux/stddef.h:16:32: error: invalid use of undefined type 'struct aperture_range'
    #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
                                   ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:24:21: note: in expansion of macro 'offsetof'
     ((type *)(__mptr - offsetof(type, member))); })
                        ^~~~~~~~
   drivers/video/aperture.c:255:31: note: in expansion of macro 'container_of'
      struct aperture_range *ap = container_of(pos, struct aperture_range, lh);
                                  ^~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/mgag200/mgag200_drv.h:13,
                    from drivers/gpu/drm/mgag200/mgag200_bmc.c:10:
>> include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   In file included from include/linux/dma-buf.h:16,
                    from include/drm/drm_gem.h:38,
                    from drivers/gpu/drm/mgag200/mgag200_drv.h:18,
                    from drivers/gpu/drm/mgag200/mgag200_bmc.c:10:
>> include/linux/iosys-map.h:183:47: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
                                                  ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_set_vaddr':
>> include/linux/iosys-map.h:185:5: error: dereferencing pointer to incomplete type 'struct iosys_map'
     map->vaddr = vaddr;
        ^~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:196:53: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
                                                        ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_set_vaddr_iomem':
   include/linux/iosys-map.h:199:5: error: dereferencing pointer to incomplete type 'struct iosys_map'
     map->vaddr_iomem = vaddr_iomem;
        ^~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:214:52: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
                                                       ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_is_equal':
>> include/linux/iosys-map.h:217:9: error: dereferencing pointer to incomplete type 'const struct iosys_map'
     if (lhs->is_iomem != rhs->is_iomem)
            ^~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:235:51: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline bool iosys_map_is_null(const struct iosys_map *map)
                                                      ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_is_null':
   include/linux/iosys-map.h:237:9: error: dereferencing pointer to incomplete type 'const struct iosys_map'
     if (map->is_iomem)
            ^~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:252:50: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline bool iosys_map_is_set(const struct iosys_map *map)
                                                     ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_is_set':
>> include/linux/iosys-map.h:254:28: error: passing argument 1 of 'iosys_map_is_null' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return !iosys_map_is_null(map);
                               ^~~
   include/linux/iosys-map.h:235:62: note: expected 'const struct iosys_map *' but argument is of type 'const struct iosys_map *'
    static inline bool iosys_map_is_null(const struct iosys_map *map)
                                         ~~~~~~~~~~~~~~~~~~~~~~~~^~~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:265:43: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void iosys_map_clear(struct iosys_map *map)
                                              ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_clear':
   include/linux/iosys-map.h:267:24: error: dereferencing pointer to incomplete type 'struct iosys_map'
     memset(map, 0, sizeof(*map));
                           ^~~~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:281:47: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
                                                  ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_memcpy_to':
   include/linux/iosys-map.h:284:9: error: dereferencing pointer to incomplete type 'struct iosys_map'
     if (dst->is_iomem)
            ^~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:301:66: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void iosys_map_memcpy_from(void *dst, const struct iosys_map *src,
                                                                     ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_memcpy_from':
   include/linux/iosys-map.h:304:9: error: dereferencing pointer to incomplete type 'const struct iosys_map'
     if (src->is_iomem)
            ^~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:318:42: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void iosys_map_incr(struct iosys_map *map, size_t incr)
                                             ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_incr':
   include/linux/iosys-map.h:320:9: error: dereferencing pointer to incomplete type 'struct iosys_map'
     if (map->is_iomem)
            ^~
   include/linux/iosys-map.h: At top level:
   include/linux/iosys-map.h:336:44: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
                                               ^~~~~~~~~
   include/linux/iosys-map.h: In function 'iosys_map_memset':
   include/linux/iosys-map.h:339:9: error: dereferencing pointer to incomplete type 'struct iosys_map'
     if (dst->is_iomem)
            ^~
   In file included from include/drm/drm_gem.h:38,
                    from drivers/gpu/drm/mgag200/mgag200_drv.h:18,
                    from drivers/gpu/drm/mgag200/mgag200_bmc.c:10:
   include/linux/dma-buf.h: At top level:
>> include/linux/dma-buf.h:277:45: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
     int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
                                                ^~~~~~~~~
   include/linux/dma-buf.h:278:48: warning: 'struct iosys_map' declared inside parameter list will not be visible outside of this definition or declaration
     void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
                                                   ^~~~~~~~~
>> include/linux/dma-buf.h:332:19: error: field 'vmap_ptr' has incomplete type
     struct iosys_map vmap_ptr;
                      ^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/gpu/drm/mgag200/mgag200_drv.h:13,
                    from drivers/gpu/drm/mgag200/mgag200_ddc.c:36:
>> include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
--
   In file included from drivers/gpu/drm/mgag200/mgag200_drv.h:13,
                    from drivers/gpu/drm/mgag200/mgag200_drv.c:25:
>> include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   In file included from include/linux/dma-buf.h:16,
                    from include/drm/drm_gem.h:38,
                    from drivers/gpu/drm/mgag200/mgag200_drv.h:18,
                    from drivers/gpu/drm/mgag200/mgag200_drv.c:25:
   include/linux/iosys-map.h: In function 'iosys_map_set_vaddr':
>> include/linux/iosys-map.h:185:5: error: dereferencing pointer to incomplete type 'struct iosys_map'
     map->vaddr = vaddr;
        ^~
   include/linux/iosys-map.h: In function 'iosys_map_is_equal':
>> include/linux/iosys-map.h:217:9: error: dereferencing pointer to incomplete type 'const struct iosys_map'
     if (lhs->is_iomem != rhs->is_iomem)
            ^~
   In file included from include/drm/drm_gem.h:38,
                    from drivers/gpu/drm/mgag200/mgag200_drv.h:18,
                    from drivers/gpu/drm/mgag200/mgag200_drv.c:25:
   include/linux/dma-buf.h: At top level:
>> include/linux/dma-buf.h:332:19: error: field 'vmap_ptr' has incomplete type
     struct iosys_map vmap_ptr;
                      ^~~~~~~~
--
   In file included from drivers/gpu/drm/tiny/bochs.c:29:
>> include/video/vga.h:489:1: error: expected identifier or '(' before '?' token
    ?
    ^
   In file included from include/linux/module.h:23,
                    from drivers/gpu/drm/tiny/bochs.c:5:
   drivers/gpu/drm/tiny/bochs.c: In function '__check_modeset':
>> drivers/gpu/drm/tiny/bochs.c:66:29: error: 'bochs_modeset' undeclared (first use in this function); did you mean 'drm_mode_set'?
    module_param_named(modeset, bochs_modeset, int, 0444);
                                ^~~~~~~~~~~~~
   include/linux/moduleparam.h:430:68: note: in definition of macro '__param_check'
     static inline type __always_unused *__check_##name(void) { return(p); }
                                                                       ^
   include/linux/moduleparam.h:155:2: note: in expansion of macro 'param_check_int'
     param_check_##type(name, &(value));       \
     ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
    module_param_named(modeset, bochs_modeset, int, 0444);
    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:29: note: each undeclared identifier is reported only once for each function it appears in
    module_param_named(modeset, bochs_modeset, int, 0444);
                                ^~~~~~~~~~~~~
   include/linux/moduleparam.h:430:68: note: in definition of macro '__param_check'
     static inline type __always_unused *__check_##name(void) { return(p); }
                                                                       ^
   include/linux/moduleparam.h:155:2: note: in expansion of macro 'param_check_int'
     param_check_##type(name, &(value));       \
     ^~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
    module_param_named(modeset, bochs_modeset, int, 0444);
    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c: At top level:
>> drivers/gpu/drm/tiny/bochs.c:66:29: error: 'bochs_modeset' undeclared here (not in a function); did you mean 'drm_mode_set'?
    module_param_named(modeset, bochs_modeset, int, 0444);
                                ^~~~~~~~~~~~~
   include/linux/moduleparam.h:298:54: note: in definition of macro '__module_param_call'
         VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
                                                         ^~~
   include/linux/moduleparam.h:156:2: note: in expansion of macro 'module_param_cb'
     module_param_cb(name, &param_ops_##type, &value, perm);     \
     ^~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c:66:1: note: in expansion of macro 'module_param_named'
    module_param_named(modeset, bochs_modeset, int, 0444);
    ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tiny/bochs.c: In function 'bochs_pci_driver_init':
   drivers/gpu/drm/tiny/bochs.c:835:1: warning: control reaches end of non-void function [-Wreturn-type]
    drm_module_pci_driver_if_modeset(bochs_pci_driver, bochs_modeset);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +489 include/video/vga.h

   487	
   488	#endif /* __linux_video_vga_h__ */
 > 489	?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
