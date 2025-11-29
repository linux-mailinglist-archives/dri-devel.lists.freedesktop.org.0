Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5567C93844
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 06:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D95E10E1BF;
	Sat, 29 Nov 2025 05:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muuMujtu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D70710E0B8;
 Sat, 29 Nov 2025 05:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764394313; x=1795930313;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gBqlNedFooqN11JTXjN/tOTB158rBeHMd6y7NK/5C8I=;
 b=muuMujtuPtTHtrs8OsL7bImm8NY97z17Yc13d5I4pGVeCWVFsb6fFG31
 WKP6v+zoSMSVg3Orlw9VOYN7Pu5i0ghvYgL5i2vBnVKusvkGQN0qB/syL
 HgATZwe95LxGiNne8cGtL8xDxmxLmARjoQNu7lOxdAAGj9rSePh+9mRt4
 bIoZ0UXsNoYNWJQfOy9Vk/iREJ4/gAyyN34wCtOCQIPVI9W0ie6OsvQxP
 bJnkJ3qwxMr3ZZjxa6JRYvuYKzSZctfpEzz5mnYpKfUtkXASZTN9M/8dQ
 q2sHFCZ6O9HXXxUI3539VoRQRo9shOBKb3kIw3P3KT0fBnGELenJFvJhm g==;
X-CSE-ConnectionGUID: XBUSEK86QriW3NW+iJDt/g==
X-CSE-MsgGUID: XNAjcXDPQLq9peQQo7+QEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="66443547"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; d="scan'208";a="66443547"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 21:31:52 -0800
X-CSE-ConnectionGUID: lC3ULNEfRzqNiN3PbHJG1A==
X-CSE-MsgGUID: tUUibmUaSf63VrE/phV1yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; d="scan'208";a="193262698"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
 by fmviesa007.fm.intel.com with ESMTP; 28 Nov 2025 21:31:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vPDYh-000000006zF-3bCX;
 Sat, 29 Nov 2025 05:31:47 +0000
Date: Sat, 29 Nov 2025 13:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, Harry.Wentland@amd.com,
 Nicholas.Kazlauskas@amd.com, simona@ffwll.ch, airlied@gmail.com,
 Leo Li <sunpeng.li@amd.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
Message-ID: <202511291309.Ur1ho1CM-lkp@intel.com>
References: <20251127235800.831297-2-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251127235800.831297-2-sunpeng.li@amd.com>
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc7]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip drm-exynos/exynos-drm-next next-20251128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Implement-prepare_vblank_enable-callback/20251128-075952
base:   linus/master
patch link:    https://lore.kernel.org/r/20251127235800.831297-2-sunpeng.li%40amd.com
patch subject: [PATCH 2/2] drm/amd/display: Implement prepare_vblank_enable callback
config: x86_64-randconfig-075-20251129 (https://download.01.org/0day-ci/archive/20251129/202511291309.Ur1ho1CM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291309.Ur1ho1CM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291309.Ur1ho1CM-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                     ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1762:9: note: in expansion of macro 'list_for_each_entry'
    1762 |         list_for_each_entry(da, &adev->dm.da_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/seqlock.h:19,
                    from include/linux/mmzone.h:17:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_init':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:1891:29: error: 'struct amdgpu_display_manager' has no member named 'dpia_aux_lock'
    1891 |         mutex_init(&adev->dm.dpia_aux_lock);
         |                             ^
   include/linux/mutex.h:64:23: note: in definition of macro 'mutex_init'
      64 |         __mutex_init((mutex), #mutex, &__key);                          \
         |                       ^~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2012:21: error: 'struct amdgpu_display_manager' has no member named 'edp0_on_dp1_quirk'
    2012 |         if (adev->dm.edp0_on_dp1_quirk)
         |                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2015:21: error: 'struct amdgpu_display_manager' has no member named 'bb_from_dmub'
    2015 |         if (adev->dm.bb_from_dmub)
         |                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2016:50: error: 'struct amdgpu_display_manager' has no member named 'bb_from_dmub'
    2016 |                 init_data.bb_from_dmub = adev->dm.bb_from_dmub;
         |                                                  ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2088:17: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2088 |         adev->dm.hpd_rx_offload_wq = hpd_rx_irq_create_workqueue(adev);
         |                 ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2089:22: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2089 |         if (!adev->dm.hpd_rx_offload_wq) {
         |                      ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2135:42: error: 'struct amdgpu_display_manager' has no member named 'dmub_aux_transfer_done'
    2135 |                 init_completion(&adev->dm.dmub_aux_transfer_done);
         |                                          ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2142:25: error: 'struct amdgpu_display_manager' has no member named 'delayed_hpd_wq'
    2142 |                 adev->dm.delayed_hpd_wq = create_singlethread_workqueue("amdgpu_dm_hpd_wq");
         |                         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2143:30: error: 'struct amdgpu_display_manager' has no member named 'delayed_hpd_wq'
    2143 |                 if (!adev->dm.delayed_hpd_wq) {
         |                              ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2155:59: error: 'struct amdgpu_display_manager' has no member named 'fused_io'
    2155 |                 for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
         |                                                           ^
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2155:59: error: 'struct amdgpu_display_manager' has no member named 'fused_io'
    2155 |                 for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
         |                                                           ^
   include/linux/array_size.h:11:48: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2155:59: error: 'struct amdgpu_display_manager' has no member named 'fused_io'
    2155 |                 for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
         |                                                           ^
   include/linux/compiler.h:197:84: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/compiler.h:201:35: note: in expansion of macro '__same_type'
     201 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                   ^~~~~~~~~~~
   include/linux/compiler.h:202:58: note: in expansion of macro '__is_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                          ^~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2155:40: note: in expansion of macro 'ARRAY_SIZE'
    2155 |                 for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
         |                                        ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2155:59: error: 'struct amdgpu_display_manager' has no member named 'fused_io'
    2155 |                 for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
         |                                                           ^
   include/linux/compiler.h:197:84: note: in definition of macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                    ^
   include/linux/compiler.h:201:35: note: in expansion of macro '__same_type'
     201 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                   ^~~~~~~~~~~
   include/linux/compiler.h:202:58: note: in expansion of macro '__is_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                          ^~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2155:40: note: in expansion of macro 'ARRAY_SIZE'
    2155 |                 for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
         |                                        ^~~~~~~~~~
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2155:40: note: in expansion of macro 'ARRAY_SIZE'
    2155 |                 for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
         |                                        ^~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2156:50: error: 'struct amdgpu_display_manager' has no member named 'fused_io'
    2156 |                         init_completion(&adev->dm.fused_io[i].replied);
         |                                                  ^
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2199:22: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2199 |         if (!adev->dm.secure_display_ctx.crtc_ctx)
         |                      ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2203:25: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2203 |                 adev->dm.secure_display_ctx.support_mul_roi = true;
         |                         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_fini':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2247:21: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2247 |         if (adev->dm.secure_display_ctx.crtc_ctx) {
         |                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2249:37: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2249 |                         if (adev->dm.secure_display_ctx.crtc_ctx[i].crtc) {
         |                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2250:53: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2250 |                                 flush_work(&adev->dm.secure_display_ctx.crtc_ctx[i].notify_ta_work);
         |                                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2251:53: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2251 |                                 flush_work(&adev->dm.secure_display_ctx.crtc_ctx[i].forward_roi_work);
         |                                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2254:31: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2254 |                 kfree(adev->dm.secure_display_ctx.crtc_ctx);
         |                               ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2255:25: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
    2255 |                 adev->dm.secure_display_ctx.crtc_ctx = NULL;
         |                         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2269:51: error: 'struct amdgpu_display_manager' has no member named 'delayed_hpd_wq'
    2269 |                         destroy_workqueue(adev->dm.delayed_hpd_wq);
         |                                                   ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2270:33: error: 'struct amdgpu_display_manager' has no member named 'delayed_hpd_wq'
    2270 |                         adev->dm.delayed_hpd_wq = NULL;
         |                                 ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2279:21: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2279 |         if (adev->dm.hpd_rx_offload_wq && adev->dm.dc) {
         |                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2281:37: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2281 |                         if (adev->dm.hpd_rx_offload_wq[i].wq) {
         |                                     ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2282:59: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2282 |                                 destroy_workqueue(adev->dm.hpd_rx_offload_wq[i].wq);
         |                                                           ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2283:41: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2283 |                                 adev->dm.hpd_rx_offload_wq[i].wq = NULL;
         |                                         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2287:31: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2287 |                 kfree(adev->dm.hpd_rx_offload_wq);
         |                               ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2288:25: error: 'struct amdgpu_display_manager' has no member named 'hpd_rx_offload_wq'
    2288 |                 adev->dm.hpd_rx_offload_wq = NULL;
         |                         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2311:32: error: 'struct amdgpu_display_manager' has no member named 'dpia_aux_lock'
    2311 |         mutex_destroy(&adev->dm.dpia_aux_lock);
         |                                ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_dmub_sw_init':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2611:17: error: 'struct amdgpu_display_manager' has no member named 'bb_from_dmub'
    2611 |         adev->dm.bb_from_dmub = dm_dmub_get_vbios_bounding_box(adev);
         |                 ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_sw_init':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2629:33: error: 'struct amdgpu_display_manager' has no member named 'da_list'
    2629 |         INIT_LIST_HEAD(&adev->dm.da_list);
         |                                 ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'dm_sw_fini':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2643:42: error: 'struct amdgpu_display_manager' has no member named 'da_list'
    2643 |         list_for_each_entry(da, &adev->dm.da_list, list) {
         |                                          ^
   include/linux/container_of.h:20:33: note: in definition of macro 'container_of'
      20 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2643:9: note: in expansion of macro 'list_for_each_entry'
    2643 |         list_for_each_entry(da, &adev->dm.da_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2643:42: error: 'struct amdgpu_display_manager' has no member named 'da_list'
    2643 |         list_for_each_entry(da, &adev->dm.da_list, list) {
         |                                          ^
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:609:9: note: in expansion of macro 'container_of'
     609 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:620:9: note: in expansion of macro 'list_entry'
     620 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:782:20: note: in expansion of macro 'list_first_entry'
     782 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2643:9: note: in expansion of macro 'list_for_each_entry'
    2643 |         list_for_each_entry(da, &adev->dm.da_list, list) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2643:42: error: 'struct amdgpu_display_manager' has no member named 'da_list'
--
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:91,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:30:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:597:9: error: expected ':', ',', ';', '}' or '__attribute__' before 'struct'
     597 |         struct secure_display_context secure_display_ctx;
         |         ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c: In function 'update_phy_id_mapping':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:98:11: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
      98 |         dm->secure_display_ctx.phy_mapping_updated = false;
         |           ^~
   In file included from include/linux/string.h:382,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/drm/drm_crtc.h:28,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:27:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:67: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |                                                                   ^~
   include/linux/fortify-string.h:502:42: note: in definition of macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:9: note: in expansion of macro 'memset'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |         ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:18: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |                  ^~
   include/linux/fortify-string.h:503:44: note: in definition of macro '__fortify_memset_chk'
     503 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                            ^~~~~~
   include/linux/fortify-string.h:513:17: note: in expansion of macro '__struct_size'
     513 |                 __struct_size(p), __member_size(p))
         |                 ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:9: note: in expansion of macro 'memset'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |         ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:18: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |                  ^~
   include/linux/fortify-string.h:503:52: note: in definition of macro '__fortify_memset_chk'
     503 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                    ^~~~~~~~~~~~
   include/linux/fortify-string.h:513:35: note: in expansion of macro '__member_size'
     513 |                 __struct_size(p), __member_size(p))
         |                                   ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:9: note: in expansion of macro 'memset'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |         ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:18: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |                  ^~
   include/linux/fortify-string.h:504:29: note: in definition of macro '__fortify_memset_chk'
     504 |         __underlying_memset(p, c, __fortify_size);                      \
         |                             ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:9: note: in expansion of macro 'memset'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |         ^~~~~~
   include/linux/fortify-string.h:503:65: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     503 |         fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
         |                                                                 ^
   include/linux/fortify-string.h:512:25: note: in expansion of macro '__fortify_memset_chk'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                         ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:194:9: note: in expansion of macro 'memset'
     194 |         memset(dm->secure_display_ctx.phy_id_mapping, 0, sizeof(dm->secure_display_ctx.phy_id_mapping));
         |         ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:198:19: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     198 |                 dm->secure_display_ctx.phy_id_mapping[idx].assigned = true;
         |                   ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:199:19: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     199 |                 dm->secure_display_ctx.phy_id_mapping[idx].is_mst = false;
         |                   ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:200:19: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     200 |                 dm->secure_display_ctx.phy_id_mapping[idx].enc_hw_inst = aconnector->dc_link->link_enc_hw_inst;
         |                   ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:203:27: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     203 |                         dm->secure_display_ctx.phy_id_mapping[idx].is_mst = true;
         |                           ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:204:27: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     204 |                         dm->secure_display_ctx.phy_id_mapping[idx].lct = aconnector->mst_output_port->parent->lct;
         |                           ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:205:27: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     205 |                         dm->secure_display_ctx.phy_id_mapping[idx].port_num = aconnector->mst_output_port->port_num;
         |                           ^~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:206:34: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     206 |                         memcpy(dm->secure_display_ctx.phy_id_mapping[idx].rad,
         |                                  ^~
   include/linux/fortify-string.h:628:34: note: in definition of macro '__fortify_memcpy_chk'
     628 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:691:17: note: in expansion of macro '__struct_size'
     691 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:206:25: note: in expansion of macro 'memcpy'
     206 |                         memcpy(dm->secure_display_ctx.phy_id_mapping[idx].rad,
         |                         ^~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:206:34: error: 'struct amdgpu_display_manager' has no member named 'secure_display_ctx'
     206 |                         memcpy(dm->secure_display_ctx.phy_id_mapping[idx].rad,
         |                                  ^~
   include/linux/fortify-string.h:630:40: note: in definition of macro '__fortify_memcpy_chk'
     630 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:692:17: note: in expansion of macro '__member_size'
     692 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~


vim +2199 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

28d43d0895896f Leo Li               2024-08-27  1877  
7578ecda14d521 Alex Deucher         2017-10-10  1878  static int amdgpu_dm_init(struct amdgpu_device *adev)
4562236b3bc0a2 Harry Wentland       2017-09-12  1879  {
4562236b3bc0a2 Harry Wentland       2017-09-12  1880  	struct dc_init_data init_data;
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  1881  	struct dc_callback_init init_params;
743b9786b14ae0 Nicholas Kazlauskas  2019-10-24  1882  	int r;
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  1883  
4a580877bdcb83 Luben Tuikov         2020-08-24  1884  	adev->dm.ddev = adev_to_drm(adev);
4562236b3bc0a2 Harry Wentland       2017-09-12  1885  	adev->dm.adev = adev;
4562236b3bc0a2 Harry Wentland       2017-09-12  1886  
4562236b3bc0a2 Harry Wentland       2017-09-12  1887  	/* Zero all the fields */
4562236b3bc0a2 Harry Wentland       2017-09-12  1888  	memset(&init_data, 0, sizeof(init_data));
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  1889  	memset(&init_params, 0, sizeof(init_params));
4562236b3bc0a2 Harry Wentland       2017-09-12  1890  
ead08b95fa50f4 Stylon Wang          2022-11-10  1891  	mutex_init(&adev->dm.dpia_aux_lock);
674e78acae0dfb Nicholas Kazlauskas  2018-12-05  1892  	mutex_init(&adev->dm.dc_lock);
6ce8f316673f61 Nicholas Kazlauskas  2019-07-11  1893  	mutex_init(&adev->dm.audio_lock);
674e78acae0dfb Nicholas Kazlauskas  2018-12-05  1894  
4562236b3bc0a2 Harry Wentland       2017-09-12  1895  	if (amdgpu_dm_irq_init(adev)) {
8ade4736075a83 Mario Limonciello    2025-05-02  1896  		drm_err(adev_to_drm(adev), "failed to initialize DM IRQ support.\n");
4562236b3bc0a2 Harry Wentland       2017-09-12  1897  		goto error;
4562236b3bc0a2 Harry Wentland       2017-09-12  1898  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  1899  
4562236b3bc0a2 Harry Wentland       2017-09-12  1900  	init_data.asic_id.chip_family = adev->family;
4562236b3bc0a2 Harry Wentland       2017-09-12  1901  
2dc31ca1895c16 Aly-Tawfik           2020-02-25  1902  	init_data.asic_id.pci_revision_id = adev->pdev->revision;
4562236b3bc0a2 Harry Wentland       2017-09-12  1903  	init_data.asic_id.hw_internal_rev = adev->external_rev_id;
dae66a04459271 Charlene Liu         2021-09-20  1904  	init_data.asic_id.chip_id = adev->pdev->device;
4562236b3bc0a2 Harry Wentland       2017-09-12  1905  
770d13b19fdf36 Christian König      2018-01-12  1906  	init_data.asic_id.vram_width = adev->gmc.vram_width;
4562236b3bc0a2 Harry Wentland       2017-09-12  1907  	/* TODO: initialize init_data.asic_id.vram_type here!!!! */
4562236b3bc0a2 Harry Wentland       2017-09-12  1908  	init_data.asic_id.atombios_base_address =
4562236b3bc0a2 Harry Wentland       2017-09-12  1909  		adev->mode_info.atom_context->bios;
4562236b3bc0a2 Harry Wentland       2017-09-12  1910  
4562236b3bc0a2 Harry Wentland       2017-09-12  1911  	init_data.driver = adev;
4562236b3bc0a2 Harry Wentland       2017-09-12  1912  
7920af262ad1ff Aurabindo Pillai     2024-05-16  1913  	/* cgs_device was created in dm_sw_init() */
4562236b3bc0a2 Harry Wentland       2017-09-12  1914  	init_data.cgs_device = adev->dm.cgs_device;
4562236b3bc0a2 Harry Wentland       2017-09-12  1915  
4562236b3bc0a2 Harry Wentland       2017-09-12  1916  	init_data.dce_environment = DCE_ENV_PRODUCTION_DRV;
4562236b3bc0a2 Harry Wentland       2017-09-12  1917  
4e8303cf2c4dd2 Lijo Lazar           2023-09-11  1918  	switch (amdgpu_ip_version(adev, DCE_HWIP, 0)) {
c08182f2483f94 Alex Deucher         2021-09-29  1919  	case IP_VERSION(2, 1, 0):
91adec9e07097e Mario Limonciello    2021-11-02  1920  		switch (adev->dm.dmcub_fw_version) {
91adec9e07097e Mario Limonciello    2021-11-02  1921  		case 0: /* development */
91adec9e07097e Mario Limonciello    2021-11-02  1922  		case 0x1: /* linux-firmware.git hash 6d9f399 */
91adec9e07097e Mario Limonciello    2021-11-02  1923  		case 0x01000000: /* linux-firmware.git hash 9a0b0f4 */
91adec9e07097e Mario Limonciello    2021-11-02  1924  			init_data.flags.disable_dmcu = false;
91adec9e07097e Mario Limonciello    2021-11-02  1925  			break;
91adec9e07097e Mario Limonciello    2021-11-02  1926  		default:
71c0fd9221a4f7 Roman Li             2020-10-08  1927  			init_data.flags.disable_dmcu = true;
91adec9e07097e Mario Limonciello    2021-11-02  1928  		}
60fb100b3d1676 Alex Deucher         2020-01-08  1929  		break;
fd546bc5ad909f Alex Deucher         2022-02-21  1930  	case IP_VERSION(2, 0, 3):
fd546bc5ad909f Alex Deucher         2022-02-21  1931  		init_data.flags.disable_dmcu = true;
fd546bc5ad909f Alex Deucher         2022-02-21  1932  		break;
fd546bc5ad909f Alex Deucher         2022-02-21  1933  	default:
fd546bc5ad909f Alex Deucher         2022-02-21  1934  		break;
fd546bc5ad909f Alex Deucher         2022-02-21  1935  	}
fd546bc5ad909f Alex Deucher         2022-02-21  1936  
098c13079c6fdd Yifan Zhang          2023-09-27  1937  	/* APU support S/G display by default except:
098c13079c6fdd Yifan Zhang          2023-09-27  1938  	 * ASICs before Carrizo,
098c13079c6fdd Yifan Zhang          2023-09-27  1939  	 * RAVEN1 (Users reported stability issue)
098c13079c6fdd Yifan Zhang          2023-09-27  1940  	 */
098c13079c6fdd Yifan Zhang          2023-09-27  1941  
098c13079c6fdd Yifan Zhang          2023-09-27  1942  	if (adev->asic_type < CHIP_CARRIZO) {
098c13079c6fdd Yifan Zhang          2023-09-27  1943  		init_data.flags.gpu_vm_support = false;
098c13079c6fdd Yifan Zhang          2023-09-27  1944  	} else if (adev->asic_type == CHIP_RAVEN) {
098c13079c6fdd Yifan Zhang          2023-09-27  1945  		if (adev->apu_flags & AMD_APU_IS_RAVEN)
169ed4ece8373f Hamza Mahfooz        2023-09-08  1946  			init_data.flags.gpu_vm_support = false;
098c13079c6fdd Yifan Zhang          2023-09-27  1947  		else
098c13079c6fdd Yifan Zhang          2023-09-27  1948  			init_data.flags.gpu_vm_support = (amdgpu_sg_display != 0);
098c13079c6fdd Yifan Zhang          2023-09-27  1949  	} else {
66369db7fdd7d5 Alex Deucher         2024-10-04  1950  		if (amdgpu_ip_version(adev, DCE_HWIP, 0) == IP_VERSION(2, 0, 3))
66369db7fdd7d5 Alex Deucher         2024-10-04  1951  			init_data.flags.gpu_vm_support = (amdgpu_sg_display == 1);
66369db7fdd7d5 Alex Deucher         2024-10-04  1952  		else
66369db7fdd7d5 Alex Deucher         2024-10-04  1953  			init_data.flags.gpu_vm_support =
66369db7fdd7d5 Alex Deucher         2024-10-04  1954  				(amdgpu_sg_display != 0) && (adev->flags & AMD_IS_APU);
098c13079c6fdd Yifan Zhang          2023-09-27  1955  	}
6e227308a91db5 Harry Wentland       2017-10-30  1956  
1efdd37cc015ed Hamza Mahfooz        2023-10-26  1957  	adev->mode_info.gpu_vm_support = init_data.flags.gpu_vm_support;
a7f520bfd0551f Alex Deucher         2022-02-21  1958  
04b94af4e348ac Alex Deucher         2018-11-06  1959  	if (amdgpu_dc_feature_mask & DC_FBC_MASK)
04b94af4e348ac Alex Deucher         2018-11-06  1960  		init_data.flags.fbc_support = true;
04b94af4e348ac Alex Deucher         2018-11-06  1961  
d99f38aed1a03f Alex Deucher         2019-08-22  1962  	if (amdgpu_dc_feature_mask & DC_MULTI_MON_PP_MCLK_SWITCH_MASK)
d99f38aed1a03f Alex Deucher         2019-08-22  1963  		init_data.flags.multi_mon_pp_mclk_switch = true;
d99f38aed1a03f Alex Deucher         2019-08-22  1964  
eaf56410ccb06f Leo Li               2019-10-21  1965  	if (amdgpu_dc_feature_mask & DC_DISABLE_FRACTIONAL_PWM_MASK)
eaf56410ccb06f Leo Li               2019-10-21  1966  		init_data.flags.disable_fractional_pwm = true;
a51482458dafb8 Zhan Liu             2021-06-14  1967  
a51482458dafb8 Zhan Liu             2021-06-14  1968  	if (amdgpu_dc_feature_mask & DC_EDP_NO_POWER_SEQUENCING)
a51482458dafb8 Zhan Liu             2021-06-14  1969  		init_data.flags.edp_no_power_sequencing = true;
eaf56410ccb06f Leo Li               2019-10-21  1970  
123202744955e6 Aurabindo Pillai     2021-12-07  1971  	if (amdgpu_dc_feature_mask & DC_DISABLE_LTTPR_DP1_4A)
123202744955e6 Aurabindo Pillai     2021-12-07  1972  		init_data.flags.allow_lttpr_non_transparent_mode.bits.DP1_4A = true;
123202744955e6 Aurabindo Pillai     2021-12-07  1973  	if (amdgpu_dc_feature_mask & DC_DISABLE_LTTPR_DP2_0)
123202744955e6 Aurabindo Pillai     2021-12-07  1974  		init_data.flags.allow_lttpr_non_transparent_mode.bits.DP2_0 = true;
123202744955e6 Aurabindo Pillai     2021-12-07  1975  
7aba117ac9e01d Jarif Aftab          2021-11-16  1976  	init_data.flags.seamless_boot_edp_requested = false;
78ad75f8d77a1a Thomas Lim           2019-05-07  1977  
bb0f84293e61f0 Mario Limonciello    2023-09-05  1978  	if (amdgpu_device_seamless_boot_supported(adev)) {
7aba117ac9e01d Jarif Aftab          2021-11-16  1979  		init_data.flags.seamless_boot_edp_requested = true;
1edf5ae1fdaffb Zhan Liu             2021-11-08  1980  		init_data.flags.allow_seamless_boot_optimization = true;
f73767b2166eef Mario Limonciello    2025-01-20  1981  		drm_dbg(adev->dm.ddev, "Seamless boot requested\n");
1edf5ae1fdaffb Zhan Liu             2021-11-08  1982  	}
1edf5ae1fdaffb Zhan Liu             2021-11-08  1983  
a820190204aef0 Leung, Martin        2022-05-13  1984  	init_data.flags.enable_mipi_converter_optimization = true;
a820190204aef0 Leung, Martin        2022-05-13  1985  
e5028e9fd3bc7c Harry Wentland       2022-02-01  1986  	init_data.dcn_reg_offsets = adev->reg_offset[DCE_HWIP][0];
2a93292fb7860b Aurabindo Pillai     2022-04-04  1987  	init_data.nbio_reg_offsets = adev->reg_offset[NBIO_HWIP][0];
8774029f76b980 Qingqing Zhuo        2023-08-02  1988  	init_data.clk_reg_offsets = adev->reg_offset[CLK_HWIP][0];
e5028e9fd3bc7c Harry Wentland       2022-02-01  1989  
c82eb25c5f005b Roman Li             2024-01-23  1990  	if (amdgpu_dc_debug_mask & DC_DISABLE_IPS)
16927047b396d1 Roman Li             2023-12-19  1991  		init_data.flags.disable_ips = DMUB_IPS_DISABLE_ALL;
a08d75927f99e5 Leo Li               2024-08-06  1992  	else if (amdgpu_dc_debug_mask & DC_DISABLE_IPS_DYNAMIC)
a08d75927f99e5 Leo Li               2024-08-06  1993  		init_data.flags.disable_ips = DMUB_IPS_DISABLE_DYNAMIC;
a08d75927f99e5 Leo Li               2024-08-06  1994  	else if (amdgpu_dc_debug_mask & DC_DISABLE_IPS2_DYNAMIC)
a08d75927f99e5 Leo Li               2024-08-06  1995  		init_data.flags.disable_ips = DMUB_IPS_RCG_IN_ACTIVE_IPS2_IN_OFF;
a08d75927f99e5 Leo Li               2024-08-06  1996  	else if (amdgpu_dc_debug_mask & DC_FORCE_IPS_ENABLE)
9ba971b25316b7 Roman Li             2024-04-12  1997  		init_data.flags.disable_ips = DMUB_IPS_ENABLE;
14813934b6290e Roman Li             2024-03-22  1998  	else
28d43d0895896f Leo Li               2024-08-27  1999  		init_data.flags.disable_ips = dm_get_default_ips_mode(adev);
16927047b396d1 Roman Li             2023-12-19  2000  
14813934b6290e Roman Li             2024-03-22  2001  	init_data.flags.disable_ips_in_vpb = 0;
ff8caade7429f2 Nicholas Kazlauskas  2023-12-07  2002  
5949e7c4890c3c Fangzhi Zuo          2025-09-24  2003  	/* DCN35 and above supports dynamic DTBCLK switch */
5949e7c4890c3c Fangzhi Zuo          2025-09-24  2004  	if (amdgpu_ip_version(adev, DCE_HWIP, 0) >= IP_VERSION(3, 5, 0))
5949e7c4890c3c Fangzhi Zuo          2025-09-24  2005  		init_data.flags.allow_0_dtb_clk = true;
5949e7c4890c3c Fangzhi Zuo          2025-09-24  2006  
198891fd2902fb Harry Wentland       2023-12-01  2007  	/* Enable DWB for tested platforms only */
ed342a2e78c4e4 Lijo Lazar           2023-12-01  2008  	if (amdgpu_ip_version(adev, DCE_HWIP, 0) >= IP_VERSION(3, 0, 0))
198891fd2902fb Harry Wentland       2023-12-01  2009  		init_data.num_virtual_links = 1;
198891fd2902fb Harry Wentland       2023-12-01  2010  
de6485e3df2417 Mario Limonciello    2025-04-22  2011  	retrieve_dmi_info(&adev->dm);
de6485e3df2417 Mario Limonciello    2025-04-22  2012  	if (adev->dm.edp0_on_dp1_quirk)
de6485e3df2417 Mario Limonciello    2025-04-22  2013  		init_data.flags.support_edp0_on_dp1 = true;
57b9f3384c64e3 Fangzhi Zuo          2022-07-06  2014  
234e94555800d6 Aurabindo Pillai     2024-05-21  2015  	if (adev->dm.bb_from_dmub)
234e94555800d6 Aurabindo Pillai     2024-05-21  2016  		init_data.bb_from_dmub = adev->dm.bb_from_dmub;
234e94555800d6 Aurabindo Pillai     2024-05-21  2017  	else
234e94555800d6 Aurabindo Pillai     2024-05-21  2018  		init_data.bb_from_dmub = NULL;
234e94555800d6 Aurabindo Pillai     2024-05-21  2019  
4562236b3bc0a2 Harry Wentland       2017-09-12  2020  	/* Display Core create. */
4562236b3bc0a2 Harry Wentland       2017-09-12  2021  	adev->dm.dc = dc_create(&init_data);
4562236b3bc0a2 Harry Wentland       2017-09-12  2022  
423788c7a866cb Ernst Sjöstrand      2017-11-07  2023  	if (adev->dm.dc) {
50d6714b242e1c Aurabindo Pillai     2025-03-18  2024  		drm_info(adev_to_drm(adev), "Display Core v%s initialized on %s\n", DC_VER,
bf7fda0b3736f9 Rodrigo Siqueira     2023-04-25  2025  			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
423788c7a866cb Ernst Sjöstrand      2017-11-07  2026  	} else {
50d6714b242e1c Aurabindo Pillai     2025-03-18  2027  		drm_info(adev_to_drm(adev), "Display Core failed to initialize with v%s!\n", DC_VER);
423788c7a866cb Ernst Sjöstrand      2017-11-07  2028  		goto error;
423788c7a866cb Ernst Sjöstrand      2017-11-07  2029  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  2030  
8a791dabea1816 Harry Wentland       2020-05-01  2031  	if (amdgpu_dc_debug_mask & DC_DISABLE_PIPE_SPLIT) {
8a791dabea1816 Harry Wentland       2020-05-01  2032  		adev->dm.dc->debug.force_single_disp_pipe_split = false;
8a791dabea1816 Harry Wentland       2020-05-01  2033  		adev->dm.dc->debug.pipe_split_policy = MPC_SPLIT_AVOID;
8a791dabea1816 Harry Wentland       2020-05-01  2034  	}
8a791dabea1816 Harry Wentland       2020-05-01  2035  
f99d8762501df5 Harry Wentland       2020-05-07  2036  	if (adev->asic_type != CHIP_CARRIZO && adev->asic_type != CHIP_STONEY)
f99d8762501df5 Harry Wentland       2020-05-07  2037  		adev->dm.dc->debug.disable_stutter = amdgpu_pp_feature_mask & PP_STUTTER_MODE ? false : true;
3ce51649cdf23a Alex Deucher         2021-10-20  2038  	if (dm_should_disable_stutter(adev->pdev))
3ce51649cdf23a Alex Deucher         2021-10-20  2039  		adev->dm.dc->debug.disable_stutter = true;
f99d8762501df5 Harry Wentland       2020-05-07  2040  
8a791dabea1816 Harry Wentland       2020-05-01  2041  	if (amdgpu_dc_debug_mask & DC_DISABLE_STUTTER)
8a791dabea1816 Harry Wentland       2020-05-01  2042  		adev->dm.dc->debug.disable_stutter = true;
8a791dabea1816 Harry Wentland       2020-05-01  2043  
c82eddf8127673 Srinivasan Shanmugam 2023-06-17  2044  	if (amdgpu_dc_debug_mask & DC_DISABLE_DSC)
8a791dabea1816 Harry Wentland       2020-05-01  2045  		adev->dm.dc->debug.disable_dsc = true;
8a791dabea1816 Harry Wentland       2020-05-01  2046  
8a791dabea1816 Harry Wentland       2020-05-01  2047  	if (amdgpu_dc_debug_mask & DC_DISABLE_CLOCK_GATING)
8a791dabea1816 Harry Wentland       2020-05-01  2048  		adev->dm.dc->debug.disable_clock_gate = true;
8a791dabea1816 Harry Wentland       2020-05-01  2049  
cfb979f7173636 Aurabindo Pillai     2022-06-28  2050  	if (amdgpu_dc_debug_mask & DC_FORCE_SUBVP_MCLK_SWITCH)
cfb979f7173636 Aurabindo Pillai     2022-06-28  2051  		adev->dm.dc->debug.force_subvp_mclk_switch = true;
cfb979f7173636 Aurabindo Pillai     2022-06-28  2052  
040585df957d45 Aurabindo Pillai     2025-05-22  2053  	if (amdgpu_dc_debug_mask & DC_DISABLE_SUBVP_FAMS) {
9d63fbf7515881 Aurabindo Pillai     2025-01-13  2054  		adev->dm.dc->debug.force_disable_subvp = true;
040585df957d45 Aurabindo Pillai     2025-05-22  2055  		adev->dm.dc->debug.fams2_config.bits.enable = false;
040585df957d45 Aurabindo Pillai     2025-05-22  2056  	}
9d63fbf7515881 Aurabindo Pillai     2025-01-13  2057  
00c391102abc13 Aurabindo Pillai     2024-03-20  2058  	if (amdgpu_dc_debug_mask & DC_ENABLE_DML2) {
a568c4947ee127 Aurabindo Pillai     2023-12-10  2059  		adev->dm.dc->debug.using_dml2 = true;
00c391102abc13 Aurabindo Pillai     2024-03-20  2060  		adev->dm.dc->debug.using_dml21 = true;
00c391102abc13 Aurabindo Pillai     2024-03-20  2061  	}
a568c4947ee127 Aurabindo Pillai     2023-12-10  2062  
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2063  	if (amdgpu_dc_debug_mask & DC_HDCP_LC_FORCE_FW_ENABLE)
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2064  		adev->dm.dc->debug.hdcp_lc_force_fw_enable = true;
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2065  
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2066  	if (amdgpu_dc_debug_mask & DC_HDCP_LC_ENABLE_SW_FALLBACK)
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2067  		adev->dm.dc->debug.hdcp_lc_enable_sw_fallback = true;
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2068  
076873e5b360cc Wayne Lin            2025-05-20  2069  	if (amdgpu_dc_debug_mask & DC_SKIP_DETECTION_LT)
076873e5b360cc Wayne Lin            2025-05-20  2070  		adev->dm.dc->debug.skip_detection_link_training = true;
076873e5b360cc Wayne Lin            2025-05-20  2071  
792a0cdde34d41 Leo Li               2022-07-06  2072  	adev->dm.dc->debug.visual_confirm = amdgpu_dc_visual_confirm;
792a0cdde34d41 Leo Li               2022-07-06  2073  
d1bc26cb5cd51f Fangzhi Zuo          2022-10-20  2074  	/* TODO: Remove after DP2 receiver gets proper support of Cable ID feature */
d1bc26cb5cd51f Fangzhi Zuo          2022-10-20  2075  	adev->dm.dc->debug.ignore_cable_id = true;
d1bc26cb5cd51f Fangzhi Zuo          2022-10-20  2076  
e3834491b92a10 Fangzhi Zuo          2023-01-16  2077  	if (adev->dm.dc->caps.dp_hdmi21_pcon_support)
50d6714b242e1c Aurabindo Pillai     2025-03-18  2078  		drm_info(adev_to_drm(adev), "DP-HDMI FRL PCON supported\n");
e3834491b92a10 Fangzhi Zuo          2023-01-16  2079  
743b9786b14ae0 Nicholas Kazlauskas  2019-10-24  2080  	r = dm_dmub_hw_init(adev);
743b9786b14ae0 Nicholas Kazlauskas  2019-10-24  2081  	if (r) {
880ab14a4acace Aurabindo Pillai     2025-03-11  2082  		drm_err(adev_to_drm(adev), "DMUB interface failed to initialize: status=%d\n", r);
743b9786b14ae0 Nicholas Kazlauskas  2019-10-24  2083  		goto error;
743b9786b14ae0 Nicholas Kazlauskas  2019-10-24  2084  	}
743b9786b14ae0 Nicholas Kazlauskas  2019-10-24  2085  
bb6785c1212988 Nicholas Kazlauskas  2020-01-10  2086  	dc_hardware_init(adev->dm.dc);
bb6785c1212988 Nicholas Kazlauskas  2020-01-10  2087  
0f774fce4499d3 Aurabindo Pillai     2025-03-11  2088  	adev->dm.hpd_rx_offload_wq = hpd_rx_irq_create_workqueue(adev);
8e794421bc9815 Wayne Lin            2021-07-23  2089  	if (!adev->dm.hpd_rx_offload_wq) {
8ade4736075a83 Mario Limonciello    2025-05-02  2090  		drm_err(adev_to_drm(adev), "failed to create hpd rx offload workqueue.\n");
8e794421bc9815 Wayne Lin            2021-07-23  2091  		goto error;
8e794421bc9815 Wayne Lin            2021-07-23  2092  	}
8e794421bc9815 Wayne Lin            2021-07-23  2093  
3ca001aff08785 Aaron Liu            2021-08-23  2094  	if ((adev->flags & AMD_IS_APU) && (adev->asic_type >= CHIP_CARRIZO)) {
e6cd859dc65f19 Alex Deucher         2020-10-27  2095  		struct dc_phy_addr_space_config pa_config;
e6cd859dc65f19 Alex Deucher         2020-10-27  2096  
c0fb85ae02b62b Yifan Zhang          2020-08-31  2097  		mmhub_read_system_context(adev, &pa_config);
c0fb85ae02b62b Yifan Zhang          2020-08-31  2098  
c0fb85ae02b62b Yifan Zhang          2020-08-31  2099  		// Call the DC init_memory func
c0fb85ae02b62b Yifan Zhang          2020-08-31  2100  		dc_setup_system_context(adev->dm.dc, &pa_config);
0b08c54bb7a370 Yifan Zhang          2020-10-20  2101  	}
c0fb85ae02b62b Yifan Zhang          2020-08-31  2102  
4562236b3bc0a2 Harry Wentland       2017-09-12  2103  	adev->dm.freesync_module = mod_freesync_create(adev->dm.dc);
4562236b3bc0a2 Harry Wentland       2017-09-12  2104  	if (!adev->dm.freesync_module) {
880ab14a4acace Aurabindo Pillai     2025-03-11  2105  		drm_err(adev_to_drm(adev),
8ade4736075a83 Mario Limonciello    2025-05-02  2106  		"failed to initialize freesync_module.\n");
4562236b3bc0a2 Harry Wentland       2017-09-12  2107  	} else
102419cdadca42 Aurabindo Pillai     2025-05-06  2108  		drm_dbg_driver(adev_to_drm(adev), "amdgpu: freesync_module init done %p.\n",
4562236b3bc0a2 Harry Wentland       2017-09-12  2109  				adev->dm.freesync_module);
4562236b3bc0a2 Harry Wentland       2017-09-12  2110  
e277adc5a06cfc Leo (Sunpeng  Li     2018-02-02  2111) 	amdgpu_dm_init_color_mod();
e277adc5a06cfc Leo (Sunpeng  Li     2018-02-02  2112) 
ea3b4242bc9ca1 Qingqing Zhuo        2021-02-09  2113  	if (adev->dm.dc->caps.max_links > 0) {
09a5df6c444cf0 Nicholas Kazlauskas  2021-08-03  2114  		adev->dm.vblank_control_workqueue =
09a5df6c444cf0 Nicholas Kazlauskas  2021-08-03  2115  			create_singlethread_workqueue("dm_vblank_control_workqueue");
09a5df6c444cf0 Nicholas Kazlauskas  2021-08-03  2116  		if (!adev->dm.vblank_control_workqueue)
8ade4736075a83 Mario Limonciello    2025-05-02  2117  			drm_err(adev_to_drm(adev), "failed to initialize vblank_workqueue.\n");
ea3b4242bc9ca1 Qingqing Zhuo        2021-02-09  2118  	}
ea3b4242bc9ca1 Qingqing Zhuo        2021-02-09  2119  
181db30bcfed09 Leo Li               2024-09-11  2120  	if (adev->dm.dc->caps.ips_support &&
181db30bcfed09 Leo Li               2024-09-11  2121  	    adev->dm.dc->config.disable_ips != DMUB_IPS_DISABLE_ALL)
afca033f10d346 Roman Li             2024-04-03  2122  		adev->dm.idle_workqueue = idle_create_workqueue(adev);
afca033f10d346 Roman Li             2024-04-03  2123  
c08182f2483f94 Alex Deucher         2021-09-29  2124  	if (adev->dm.dc->caps.max_links > 0 && adev->family >= AMDGPU_FAMILY_RV) {
e50dc17163d9a4 Bhawanpreet Lakha    2019-12-12  2125  		adev->dm.hdcp_workqueue = hdcp_create_workqueue(adev, &init_params.cp_psp, adev->dm.dc);
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  2126  
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  2127  		if (!adev->dm.hdcp_workqueue)
8ade4736075a83 Mario Limonciello    2025-05-02  2128  			drm_err(adev_to_drm(adev), "failed to initialize hdcp_workqueue.\n");
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  2129  		else
102419cdadca42 Aurabindo Pillai     2025-05-06  2130  			drm_dbg_driver(adev_to_drm(adev), "amdgpu: hdcp_workqueue init done %p.\n", adev->dm.hdcp_workqueue);
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  2131  
52704fcaf74bc9 Bhawanpreet Lakha    2019-05-24  2132  		dc_init_callbacks(adev->dm.dc, &init_params);
96a3b32e67236f Bhawanpreet Lakha    2019-06-24  2133  	}
11d526f1972f48 Stylon Wang          2022-07-07  2134  	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
81927e2808be5a Jude Shih            2021-04-20  2135  		init_completion(&adev->dm.dmub_aux_transfer_done);
81927e2808be5a Jude Shih            2021-04-20  2136  		adev->dm.dmub_notify = kzalloc(sizeof(struct dmub_notification), GFP_KERNEL);
81927e2808be5a Jude Shih            2021-04-20  2137  		if (!adev->dm.dmub_notify) {
8ade4736075a83 Mario Limonciello    2025-05-02  2138  			drm_info(adev_to_drm(adev), "fail to allocate adev->dm.dmub_notify");
81927e2808be5a Jude Shih            2021-04-20  2139  			goto error;
81927e2808be5a Jude Shih            2021-04-20  2140  		}
e27c41d5b0681c Jude Shih            2021-07-25  2141  
e27c41d5b0681c Jude Shih            2021-07-25  2142  		adev->dm.delayed_hpd_wq = create_singlethread_workqueue("amdgpu_dm_hpd_wq");
e27c41d5b0681c Jude Shih            2021-07-25  2143  		if (!adev->dm.delayed_hpd_wq) {
8ade4736075a83 Mario Limonciello    2025-05-02  2144  			drm_err(adev_to_drm(adev), "failed to create hpd offload workqueue.\n");
e27c41d5b0681c Jude Shih            2021-07-25  2145  			goto error;
e27c41d5b0681c Jude Shih            2021-07-25  2146  		}
e27c41d5b0681c Jude Shih            2021-07-25  2147  
81927e2808be5a Jude Shih            2021-04-20  2148  		amdgpu_dm_outbox_init(adev);
e27c41d5b0681c Jude Shih            2021-07-25  2149  		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_AUX_REPLY,
e27c41d5b0681c Jude Shih            2021-07-25  2150  			dmub_aux_setconfig_callback, false)) {
8ade4736075a83 Mario Limonciello    2025-05-02  2151  			drm_err(adev_to_drm(adev), "fail to register dmub aux callback");
e27c41d5b0681c Jude Shih            2021-07-25  2152  			goto error;
e27c41d5b0681c Jude Shih            2021-07-25  2153  		}
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2154  
ce801e5d6c1bac Dominik Kaszewski    2025-03-27 @2155  		for (size_t i = 0; i < ARRAY_SIZE(adev->dm.fused_io); i++)
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2156  			init_completion(&adev->dm.fused_io[i].replied);
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2157  
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2158  		if (!register_dmub_notify_callback(adev, DMUB_NOTIFICATION_FUSED_IO,
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2159  			dmub_aux_fused_io_callback, false)) {
8ade4736075a83 Mario Limonciello    2025-05-02  2160  			drm_err(adev_to_drm(adev), "fail to register dmub fused io callback");
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2161  			goto error;
ce801e5d6c1bac Dominik Kaszewski    2025-03-27  2162  		}
11d526f1972f48 Stylon Wang          2022-07-07  2163  		/* Enable outbox notification only after IRQ handlers are registered and DMUB is alive.
22e1dc4b2fec17 Wayne Lin            2024-02-02  2164  		 * It is expected that DMUB will resend any pending notifications at this point. Note
22e1dc4b2fec17 Wayne Lin            2024-02-02  2165  		 * that hpd and hpd_irq handler registration are deferred to register_hpd_handlers() to
22e1dc4b2fec17 Wayne Lin            2024-02-02  2166  		 * align legacy interface initialization sequence. Connection status will be proactivly
22e1dc4b2fec17 Wayne Lin            2024-02-02  2167  		 * detected once in the amdgpu_dm_initialize_drm_device.
11d526f1972f48 Stylon Wang          2022-07-07  2168  		 */
11d526f1972f48 Stylon Wang          2022-07-07  2169  		dc_enable_dmub_outbox(adev->dm.dc);
11d526f1972f48 Stylon Wang          2022-07-07  2170  
7ce34cbfab26c0 Stylon Wang          2023-06-30  2171  		/* DPIA trace goes to dmesg logs only if outbox is enabled */
7ce34cbfab26c0 Stylon Wang          2023-06-30  2172  		if (amdgpu_dc_debug_mask & DC_ENABLE_DPIA_TRACE)
7ce34cbfab26c0 Stylon Wang          2023-06-30  2173  			dc_dmub_srv_enable_dpia_trace(adev->dm.dc);
7ce34cbfab26c0 Stylon Wang          2023-06-30  2174  	}
7ce34cbfab26c0 Stylon Wang          2023-06-30  2175  
1c43a48b44a544 Stylon Wang          2022-10-24  2176  	if (amdgpu_dm_initialize_drm_device(adev)) {
880ab14a4acace Aurabindo Pillai     2025-03-11  2177  		drm_err(adev_to_drm(adev),
8ade4736075a83 Mario Limonciello    2025-05-02  2178  		"failed to initialize sw for display support.\n");
1c43a48b44a544 Stylon Wang          2022-10-24  2179  		goto error;
1c43a48b44a544 Stylon Wang          2022-10-24  2180  	}
1c43a48b44a544 Stylon Wang          2022-10-24  2181  
f74367e492ba24 Alex Deucher         2020-07-10  2182  	/* create fake encoders for MST */
f74367e492ba24 Alex Deucher         2020-07-10  2183  	dm_dp_create_fake_mst_encoders(adev);
f74367e492ba24 Alex Deucher         2020-07-10  2184  
4562236b3bc0a2 Harry Wentland       2017-09-12  2185  	/* TODO: Add_display_info? */
4562236b3bc0a2 Harry Wentland       2017-09-12  2186  
4562236b3bc0a2 Harry Wentland       2017-09-12  2187  	/* TODO use dynamic cursor width */
4a580877bdcb83 Luben Tuikov         2020-08-24  2188  	adev_to_drm(adev)->mode_config.cursor_width = adev->dm.dc->caps.max_cursor_size;
4a580877bdcb83 Luben Tuikov         2020-08-24  2189  	adev_to_drm(adev)->mode_config.cursor_height = adev->dm.dc->caps.max_cursor_size;
4562236b3bc0a2 Harry Wentland       2017-09-12  2190  
4a580877bdcb83 Luben Tuikov         2020-08-24  2191  	if (drm_vblank_init(adev_to_drm(adev), adev->dm.display_indexes_num)) {
cc9428d5336aec Saleemkhan Jamadar   2025-03-21  2192  		drm_err(adev_to_drm(adev),
3b14fe98939b01 Roman Li             2025-08-21  2193  		"failed to initialize vblank for display support.\n");
4562236b3bc0a2 Harry Wentland       2017-09-12  2194  		goto error;
4562236b3bc0a2 Harry Wentland       2017-09-12  2195  	}
4562236b3bc0a2 Harry Wentland       2017-09-12  2196  
f477c7b5ec3e4e Alan Liu             2023-04-10  2197  #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
58a8467a3493c0 Wayne Lin            2024-10-31  2198  	amdgpu_dm_crtc_secure_display_create_contexts(adev);
58a8467a3493c0 Wayne Lin            2024-10-31 @2199  	if (!adev->dm.secure_display_ctx.crtc_ctx)
8ade4736075a83 Mario Limonciello    2025-05-02  2200  		drm_err(adev_to_drm(adev), "failed to initialize secure display contexts.\n");
9a45ad15a1e264 Wayne Lin            2024-07-22  2201  
9a45ad15a1e264 Wayne Lin            2024-07-22  2202  	if (amdgpu_ip_version(adev, DCE_HWIP, 0) >= IP_VERSION(4, 0, 1))
9a45ad15a1e264 Wayne Lin            2024-07-22  2203  		adev->dm.secure_display_ctx.support_mul_roi = true;
9a45ad15a1e264 Wayne Lin            2024-07-22  2204  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
